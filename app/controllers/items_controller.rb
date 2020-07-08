class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category, :condition, :postage_payer, :prefecture, :standby_day, :trading_status, :seller, :buyer)
    # .merge(seller: current_user.id) ログイン機能実装後に反映可能
  end

end
