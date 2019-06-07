class ChangeDataDeliveryDateToItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :delivery_date, :integer
  end
end
