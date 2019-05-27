class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.string :card_number
      t.integer :expiration_month
      t.integer :expiration_year
      t.string :security_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
