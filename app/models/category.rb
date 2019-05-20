class Category < ActiveRecord::Base
  has_many :item, through: :category
  has_many :category
  has_ancestry
end
