class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  enum item_condition: {"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}
  enum delivery_date: {"1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}
  enum delivery_burden: {"着払い(購入者負担)": false, "送料込み(出品者負担)": true}

  belongs_to_active_hash :delivery_area, primary_key: :delivery_area_id
  has_many :item_images
  has_many :comments
  has_many :orders
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
   # accepts_nested_attributes_for :item_images
  end
