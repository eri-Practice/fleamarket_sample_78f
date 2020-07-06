# fleamarket_sample_78f  DB設計

## Users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|mail|string|VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/inull:false, unique: true, index:true,  format: { with: VALID_EMAIL_REGEX }|
|password|string|null:false|
|introduction|text|
|image|string|
## Association
- has_many :comments, dependent: :destroy		
- has_many :seller_items, foreign_key: "seller_id", class_name: "Item"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item"
- has_one :profile, dependent: :destroy		
- has_one :sending_destination, dependent: :destroy		
- has_one :credit_card, dependent: :destroy		

### Profiles table
|Column|Type|Options|
|------|----|-------|
|family_name|string|null:false|
|first_name_kana|string|null:false| <!--ユーザー本名は全角で入力させる -->
|family_name_kana|string|null:false| <!--ユーザー本名は全角で入力させる -->
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_day|date|null:false|
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

### Items table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|introduction|text|null:false|
|price|integer|null:false|
|item_condition|references|null: false, foreign_key: true|
|postage_payer|references|null: false, foreign_key: true|
|prefecture_code|integer|null:false|
|preparation_day|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp|
### Association
- has_many :favorites
- has_many :item_imgs, dependent: :destroy
- has_one :user_evaluation
- belongs_to :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_type
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- Gem：jp_prefectureを使用して都道府県コードを取得

### Item_imgs table
|Column|Type|Options|
|------|----|-------|
|url|string|null:false|
|item|reference|null: false, foreign_key:true|
## Association
- belongs_to :item

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
|phone_number|integer|unique: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Credit_cards table
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

### Postage_payers table
|Column|Type|Options|
|------|----|-------|
|postage_payer|string|null:false|
## Association
- has_many :items

### Preparation_day table
|Column|Type|Options|
|------|----|-------|
|preparation_day|string|null:false|
## Association
- has_many :items

### Categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- has_many :item