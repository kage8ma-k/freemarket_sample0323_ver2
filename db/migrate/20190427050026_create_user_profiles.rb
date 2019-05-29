class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.integer :profile
      t.string :profile_image
      t.string :lastname,   null: false
      t.string :firstname,  null: false
      t.string :lastname_kana,  null: false
      t.string :firstname_kana, null: false
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.integer :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :block_number
      t.string :building_name
      t.integer :phone_number
      t.integer :the_number_of_exhabitions
      t.integer :points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
