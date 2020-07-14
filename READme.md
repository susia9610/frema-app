# frema_70c DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|satetime|

### Association
- has_one  :address
- has_many :comments, dependent: :destroy
- has_many :sns_credentials
- has_many :creditcard
- has_many :buyer_items, class_name: "Item", foreign_key: "buyer_id"
- has_many :seller_items, class_name: "Item", foreign_key: "seller_id"

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|post_number|string|null: false|
|prefecture_id|string|null: false|
|local|string|null: false|
|local_number|string|null: false|
|building|string||
|tel_number|string||
|user|references|null: false,foreign_key:true|

### Association
- belongs_to_active_hash :prefecture
- belongs_to :user, optional: true

## creditcardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user|references|null: false,foreign_key:true|

### Association
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false,foreign_key:true|
|item_id|integer|null: false,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item

### index
add_index :comments, [:user_id, :item_id]


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition_id|string|null: false|
|prefecture_id|string|null: false|
|size|string||
|price|integer|null: false|
|shipping_days_id|integer|null: false|
|postage_id|string|null: false|
|category_id|integer|null: false|
|brand|string|null: false|
|status_id|string||

### Association
- belongs_to_active_hash :prefecture
- belings_to_active_hash :postage
- belongs_to_active_hash :shipping_days
- belongs_to :category
- belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
- belongs_to :seller, class_name: "User", foreign_key: "seller_id", optional: true
- has_many :images, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false,foreign_key:true|

### Association
- belongs_to :item, optional: true

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|

### Association
- has_many :items
- has_ancestry

## ancestries_categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|

## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user|references|foreign_key|

### Association
- belongs_to :user, optional: true

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|
|user_id, :item_id|index|unique: true|

### Association
- belongs_to :user
- belongs_to :item