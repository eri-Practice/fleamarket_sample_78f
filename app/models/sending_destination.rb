class SendingDestination < ApplicationRecord
  validates :destination_first_name, presence: true
  validates :destination_family_name, presence: true
  validates :destination_first_name_kana, presence: true
  validates :destination_family_name_kana, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validates :house_nimber, presence: true
  validates :prefecture_code, presence: true
  belongs_to :user, optional: true
end
