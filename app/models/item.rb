class Item < ApplicationRecord
  belongs_to :category
  # アソシエーション
  validates :images, length: { minimum: 1, message: "を選択してください"}
  has_many :images, dependent: :destroy
  
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to :seller, class_name: "User"
  # バリデーション
  validates :name, presence: true, length: {maximum: 40}
  validates :text, presence: true, length: {maximum: 1000}
  validates :price, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :postage_payer, presence: true
  validates :prefecture_id, presence: true
  validates :standby_day, presence: true
  validates :trading_status, presence: true
  attribute :trading_status, default: '出品中'
  validates :seller, presence: true
end
