class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one :sending_destination, dependent: :destroy
end
