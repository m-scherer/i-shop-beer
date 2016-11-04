class AddStockStatusToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :status, :integer, default: 0
  end
end
