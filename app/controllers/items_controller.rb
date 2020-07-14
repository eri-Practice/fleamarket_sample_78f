class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new 
    @item.images.new
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
