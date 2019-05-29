class RemoveDeliveryAreaToItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :delivery_area, :string
  end
end
