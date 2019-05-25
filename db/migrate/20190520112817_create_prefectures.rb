class CreatePrefectures < ActiveRecord::Migration[5.0]
  def change
    create_table :prefectures do |t|
    t.references :item , foreign_key: true
    t.timestamps
    end
  end
end
