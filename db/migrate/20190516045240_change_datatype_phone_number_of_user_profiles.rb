class ChangeDatatypePhoneNumberOfUserProfiles < ActiveRecord::Migration[5.0]
  def change
    change_column :user_profiles, :phone_number, :bigint
  end
end
