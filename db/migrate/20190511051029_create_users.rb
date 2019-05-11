class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email,null: false,unique: true
      t.string :password
      t.timestamps
    end
  end
end
