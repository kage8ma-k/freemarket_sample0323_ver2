class AddCertificationNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :certification_number, :integer
  end
end
