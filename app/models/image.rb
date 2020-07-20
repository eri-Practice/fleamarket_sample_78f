class Image < ApplicationRecord
  # アソシエーション
  belongs_to :item, optional: true
  mount_uploader :image_url , ImageUploader
  validates :image_url, presence: true
end
