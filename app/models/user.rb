class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email, uniqueness: true

  has_one :profile, dependent: :destroy
  has_one :sending_destination, dependent: :destroy
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :sending_destination
  
end
