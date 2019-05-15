class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_area, primary_key: :delivery_area_id
   # has_many :item_images
   # has_many :comments
   # has_many :orders
   belongs_to :user
   belongs_to :brand
   belongs_to :size
   belongs_to :category
  end