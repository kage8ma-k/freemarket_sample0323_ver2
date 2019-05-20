class AddPrefectureIdToPrefecture < ActiveRecord::Migration[5.0]
  def change
    add_column :prefectures, :name, :string
  end
end
