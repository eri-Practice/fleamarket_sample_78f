class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :category, :buy]
  before_action :move_to_index_except_signed_in_user, only: [:new, :create]
  before_action :move_to_index_except_seller, only: [:edit, :update]
  
  def index
    @items = Item.all
  end
  
  def show
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
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end

  def edit
  end


  def  show
    @item = Item.find(params[:id])
    @user = User.find(current_user.id)
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      render :edit
    end
  end

  def destroy
    if@item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def buy
    @item = Item.find(params[:id])
    @user = current_user
    @sending_destination  = SendingDestination.where(user_id: current_user.id).first
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :text, :price, :category_id, :condition, :postage_payer, :prefecture_id, :standby_day, :trading_status, :buyer_id,
      images_attributes: [:image_url, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index_except_signed_in_user
    redirect_to root_path, notice: 'ログインしてください' unless user_signed_in?
  end

  def move_to_index_except_seller
    redirect_to root_path, notice: '商品の編集は出品者のみが可能です' unless user_signed_in? && current_user.id == @item.seller_id
  end

end
