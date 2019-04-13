# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|

### Association
- has_many : items
- has_many : comments
- has_many : orders
- has_one : user_profile
- has_one : credit
- has_one : evaluation



## user_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|profile|string|
|profile_image|string|
|lastname|string||null: false|
|firstname|string||null: false|
|lastname_kana|string||null: false|
|firstname_kana|string||null: false|
|birth_year|integer|
|birth_month|integer|
|birth_day|integer|
|postal_code|string||null: false|
|prefecture|string||null: false|
|city|string||null: false|
|block_number|string|
|building_name|string|
|phone_number|string|
|the_number_of_exhabitions|integer|
|points|interger|
|user_id|references|foreign_key: true|

### Association
- belongs_to : user



## creditsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|card_expiration_month|integer|null: false|
|card_expiration_year|integer|null: false|
|digit_code|integer|null: false|
|user_id|references|foreign_key: true|

### Association
- belongs_to : user



## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|good|integer|
|normal|integer|
|bad|integer|
|user_id|references|foreign_key: true|

### Association
- belongs_to : user



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|string||null: false|
|item_condition|string||null: false|
|delivery_burden|string||null: false|
|delivery_method|string||null: false|
|delivery_area|string||null: false|
|delivery_date|string||null: false|
|price|interger||null: false|
|sales_status|null: false|
|likes|interger|
|user_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|size_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Association
- has_many : item_images
- has_many : comments
- has_many : orders
- belongs_to : user
- belongs_to : brand
- belongs_to : size
- belongs_to : category



## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string||null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to : item



## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many : items



## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|volume|string|

### Association
- has_many : items



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association

- belongs_to : user
- belongs_to : item



## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association

- belongs_to : user
- belongs_to : item



## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|parent_id|integer|

### Association

- has_many : items

