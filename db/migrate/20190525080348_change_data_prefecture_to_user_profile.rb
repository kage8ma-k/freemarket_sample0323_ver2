class ChangeDataPrefectureToUserProfile < ActiveRecord::Migration[5.0]
  def change
    change_column :user_profiles, :prefecture, :string
  end
end
