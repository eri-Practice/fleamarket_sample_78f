class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  before_action :move_to_index_except_signed_in_user, only: [:new, :create]
  before_action :move_to_index_except_seller, only: [:edit, :update]

  def index
  end

  def new
    @item = Item.new 
    @item.images.build
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

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :text, :price, :category, :condition, :postage_payer, :prefecture_id, :standby_day, :trading_status, :seller, :buyer,
      images_attributes: [:image_url, :_destroy, :id]).merge(seller: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index_except_signed_in_user
    redirect_to root_path, notice: 'ログインしてください' unless user_signed_in?
  end

  def move_to_index_except_seller
    redirect_to root_path, notice: '商品の編集は出品者のみが可能です' unless user_signed_in? && current_user.id == @item.seller
  end
end
