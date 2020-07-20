class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :category]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new 
    @item.images.new
    @parents = Category.where(ancestry: nil)
    
  end

  def show
    @item = Item.find(params[:id])
    @profile = Profile.find(params[:id])
    @category = Category.find(params[:id])
  end

  def category
    respond_to do |format|
      format.html
      format.json do
        #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
        if params[:parent_id]
          @children = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        end
      end
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end


  def  show
    @item = Item.find(params[:id])
    @user = User.find(current_user.id)
  end

  def destroy
    if@item.destroy
      redirect_to root_path
    else
      render :show
    end

  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :condition, :postage_payer, :prefecture_id, :standby_day, :trading_status, :buyer_id, images_attributes: [:image_url]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
