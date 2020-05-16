# frema_70c DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|tel_number|integer|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
|password_confirmation|string|null: false|

### Association
- has_many :items,dependent: :destroy
- has_many :comments
- has_one  :card
- has_one  :address

### index
add_index: [:nickname, :email]

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|post_number|string|null: false|
|prefecture|string|null: false|
|local|string|null: false|
|local_number|string|null: false|
|building|string|null: false|
|tel_number|string||
|user_id|integer|null: false,foreign_key:true|

### Association
- belongs_to :user

### index
add_index: [:prefecture, :user_id]


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id|string||
|card_id|string||
|user_id|integer|null: false,foreign_key:true|

### Association
- belongs_to :user

### index
add_index: [:user_id]

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
add_index: [:user_id, :item_id]


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition|string|null: false|
|prefecture|string|null: false|
|size|string||
|price|integer|null: false|
|shipping_days|integer|null: false|
|postage|string|null: false|
|user_id|integer|null: false,foreign_key:true|
|category_id|integer|null: false,foreign_key:true|
|brand_id|integer|null: false,foreign_key:true|
|prefecture_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :images,dependent: :destroy
- has_many :comments

### index
add_index: [:name, :price]


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false,foreign_key:true|

### Association
- belongs_to :item


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

### index
add_index: [:name]

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items

### index
add_index: [:name]