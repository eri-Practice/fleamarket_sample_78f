# DB設計

### Users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|mail|string|null:false, unique: true, index:true,  format: { with: VALID_EMAIL_REGEX }|
|password|string|null:false|
|introduction|text|
#### Association	
- has_many :seller_items, foreign_key: "seller_id", class_name: "Item"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item"
- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

### Profiles table
|Column|Type|Options|
|------|----|-------|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_date|date|null:false|
|user_id|references|null: false, foreign_key: true|
#### Association
- belongs_to :user

### Sending_destinations table
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string|unique: true|
|user|references|null: false, foreign_key: true|
#### Association
- belongs_to :user

### Credit_cards table
|Column|Type|Options|
|------|----|-------|
|card_token|integer|null:false|
|customer_id|integer|null: false|
|user_id|references|null: false, foreign_key: true|
#### Association
- belongs_to :user

### Items table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|text|text|null:false|
|price|integer|null:false|
|category|references|null: false, foreign_key: true|
|condition|string|null: false|
|postage_payer|string|null: false|
|prefecture|integer|null:false|
|standby_day|string|null: false|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
#### Association
- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to_active_hash :prefecture

### Item_images table
|Column|Type|Options|
|------|----|-------|
|image_url|string|null:false|
|item_id|reference|null: false, foreign_key:true|
#### Association
- belongs_to :item

### Categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
#### Association
- has_many :items
