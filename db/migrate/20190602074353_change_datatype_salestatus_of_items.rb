class ChangeDatatypeSalestatusOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :sales_status, :integer
  end
end
