class ChangeDatatypePhoneNumberOfUserProfiles2 < ActiveRecord::Migration[5.0]
  def change
    change_column :user_profiles, :phone_number, :string
  end
end
