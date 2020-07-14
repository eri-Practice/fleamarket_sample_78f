class ItemsController < ApplicationController
  before_action :set_item, only: [:edit]
  before_action :move_to_index, only: [:edit]

  def index
  end

  def new
    @item = Item.new 
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      @item.images.new
      render :new
    end
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category, :condition, :postage_payer, :prefecture_id, :standby_day, :trading_status, :seller, :buyer, images_attributes: [:image_url]).merge(seller: current_user.id)
  end

  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.seller
  end
end
