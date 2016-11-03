class CreateBeerOrders < ActiveRecord::Migration
  def change
    create_table :beer_orders do |t|
      t.references :order, index: true, foreign_key: true
      t.references :beer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
