class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  has_many :comments
  has_many :orders
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  belongs_to :prefecture

  enum item_condition: {"新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5}

  enum delivery_method: {"未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3, "普通郵便(定形、定形外)": 4, "クロネコヤマト": 5, "ゆうパック": 6, "クリックポスト": 7, "ゆうパケット": 8}

  enum delivery_burden: {"送料込み(出品者負担)": 0, "着払い(購入者負担)": 1}

  enum delivery_date: {"1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送": 2}

  enum sales_status: {"published": 0, "stopped": 1, "trading": 2, "sold": 3}
  end
