class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new 
    @item.images.build
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
    params.require(:item).permit(:name, :text, :price, :category, :condition, :postage_payer, :prefecture_id, :standby_day, :trading_status, :buyer_id, images_attributes: [:image_url]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
