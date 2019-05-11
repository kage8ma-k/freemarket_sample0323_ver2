class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
     t.string  :name, null:false
     t.text    :content,null:false
     t.string :item_condition, null: false
     t.string  :delivery_burden,null: false
     t.string  :delivery_method,null: false
     t.string  :delivery_area,null: false
     t.string  :delivery_date,null: false
     t.integer :price,null: false
     t.string  :sales_status,null: false
     t.integer :likes
     t.references :user,foreign_key: true
     t.references :brand,foreign_key: true
     t.references :size,foreign_key: true
     t.references :category,foreign_key:true
      t.timestamps
    end
  end
end
