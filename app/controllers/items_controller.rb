class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new 
    @item.images.new
    # @parents = Category.all.order("id ASC").limit(13)
    @parents = Category.where(ancestry: nil)
    
  end
  def category
    respond_to do |format|
      format.html
      format.json do
        # @children = Category.find(params[:parent_id]).children
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

  

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category, :condition, :postage_payer, :prefecture_id, :standby_day, :trading_status, :seller, :buyer, images_attributes: [:image_url]).merge(seller: current_user.id)
  end

end
