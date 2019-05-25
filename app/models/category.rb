class Category < ActiveRecord::Base
  has_ancestry
  has_many :items, through: :categories
  has_many :categories
end
