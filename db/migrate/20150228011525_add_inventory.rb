class AddInventory < ActiveRecord::Migration
  def change
    add_column :admins, :inventory, :integer, default: 0
  end
end
