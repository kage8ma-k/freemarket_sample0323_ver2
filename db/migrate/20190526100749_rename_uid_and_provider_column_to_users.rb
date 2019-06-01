class RenameUidAndProviderColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :facebook_uid, :uid
    rename_column :users, :facebook_provider, :provider
    remove_column :users, :google_provider, :string
    remove_column :users, :google_uid, :string
    remove_column :users, :google_token, :string
    remove_column :users, :google_meta, :string
  end
end
