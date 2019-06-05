class ChangeDataPrefectureIdToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    change_column :user_profiles, :prefecture_id, :integer
  end
end
