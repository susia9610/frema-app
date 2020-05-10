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
|introduction|text||
|user_image|string||

### Association
- has_many :items
- has_many :addresses


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|local|string|null: false|
|local_number|string|null: false|
|building|string|null: false|
|tel_number|integer||
|user_id|integer|null: false,foreign_key:true|

### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|CVC|integer|null: false|
|limit_year|integer|null: false|
|limit_month|integer|null: false|
|name|string|null: false|
|user_id|integer|null: false,foreign_key:true|

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

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category|string|null: false|
|brand|string|null: false|
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
- has_many :images
- has_many :comments


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false,foreign_key:true|

### Association
- belongs_to :item


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items

