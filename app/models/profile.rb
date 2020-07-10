class Profile < ApplicationRecord
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, presence: true
  validates :birth_date, presence:true
  belongs_to :user, optional: true
end
