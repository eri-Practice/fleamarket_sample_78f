class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profiles, dependent: :destroy
  has_one :sending_destinations, dependent: :destroy
  accepts_nested_attributes_for :profiles
  accepts_nested_attributes_for :sending_destinations
  
end
