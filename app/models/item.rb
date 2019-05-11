class Item < ApplicationRecord
 # has_many :item_images
 # has_many :comments
 # has_many :orders
 belongs_to :user
 belongs_to :brand
 belongs_to :size
 belongs_to :category
end
