class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :nickname, presence: true
#   validates :password, presence: true
#   validates :password_confirmation, presence: true
#アソシエーション
  has_one :profile, dependent: :destroy
  has_one :sending_destination, dependent: :destroy
  has_many :seller_items, foreign_key: "seller_id", class_name: "items"
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :sending_destination
  
end
