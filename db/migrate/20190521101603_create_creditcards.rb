class CreateCreditcards < ActiveRecord::Migration[5.0]
  def change
    create_table :creditcards do |t|
      t.string :card_id, null: false
      t.string :customer_id, null: false
      t.references :user , foreign_key: true
      t.timestamps
    end
  end
end
