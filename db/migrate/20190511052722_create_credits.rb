class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.integer :card_number, null: false
      t.integer :carrd_expiration_month, null: false
      t.integer :card_expiration_year, null: false
      t.integer :digit_code, null: false
      t.references :user , foreign_key: true
      t.timestamps
    end
  end
end
