class ChangeColumnNullToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:user_profiles, :postal_code, true)
    change_column_null(:user_profiles, :prefecture, true)
    change_column_null(:user_profiles, :city, true)
  end
end
