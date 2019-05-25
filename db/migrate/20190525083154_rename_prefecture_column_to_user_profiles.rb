class RenamePrefectureColumnToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_profiles, :prefecture, :prefecture_id
  end
end
