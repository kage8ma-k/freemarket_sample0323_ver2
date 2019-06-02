class ChangeDataDeliveryBurdenToItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :delivery_burden, :integer
  end
end
