class Item < ApplicationRecord
  # アソシエーション
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, update_only: true
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
  
  # バリデーション
  validates :name, presence: true, length: {maximum: 40}
  validates :text, presence: true, length: {maximum: 1000}
  validates :price, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :postage_payer, presence: true
  validates :prefecture_id, presence: true
  validates :standby_day, presence: true
  attribute :trading_status, default: '出品中'

  # デバイス導入後に実装
  # validates :seller, presence: true
end
