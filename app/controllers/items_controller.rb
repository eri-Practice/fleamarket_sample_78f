class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new 
    @item.images.new
    @item =current_user.items.build
  end

  def create
    @item = Item.new(item_params)
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    if item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category, :condition, :postage_payer, :prefecture_id, :standby_day, :trading_status, :seller, :buyer, images_attributes: [:image_url]).merge(seller: current_user.id)
  end

end
