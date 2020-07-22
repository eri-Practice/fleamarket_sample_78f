class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_item, except: [:index, :new, :create, :category]
  before_action :move_to_index_except_signed_in_user, only: [:new, :create]
  before_action :move_to_index_except_seller, only: [:edit, :update]
  
  def index
    @items = Item.all
  end
  

  def new
    @item = Item.new 
    @item.images.new
    @parents = Category.where(ancestry: nil)
  end

  def show
    @profile = Profile.find(params[:id])
    @category = Category.find(params[:id])
    @item = Item.find(params[:id])
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
    @parents = Category.where(ancestry: nil)
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end

  def edit
    @parents = Category.where(ancestry: nil)
  end


  def  show
    @item = Item.find(params[:id])
    @user = User.find(@item.seller_id)
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
    @user = current_user
    @sending_destination  = SendingDestination.where(user_id: current_user.id).first
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_card_path, notice: 'カード情報を登録してください'
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:payjp_private_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:payjp_private_key]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    @item.buyer_id = current_user.id
    @item.save

    redirect_to root_path, notice: '商品を購入しました'
  end

  def done
    @items_buyer= Item.find(params[:id])
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
