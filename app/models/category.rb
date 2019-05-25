class Category < ActiveRecord::Base
  has_many :items, through: :categories
  has_many :categories
  has_ancestry
end
