class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|

      t.timestamps
      t.string :profile
      t.string :profile_image
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :lastname_kana, null: false
      t.string :firstname_kana, null: false
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.string :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :block_number, null: false
      t.string :building_name
      t.string :phone_number
      t.integer :the_number_of_exhabitions
      t.integer :points
      t.references :user , foreign_key: true
    end
  end
end
