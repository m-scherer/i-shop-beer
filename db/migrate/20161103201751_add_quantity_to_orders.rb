class AddQuantityToOrders < ActiveRecord::Migration
  def change
    add_column :beer_orders, :quantity, :integer
  end
end
