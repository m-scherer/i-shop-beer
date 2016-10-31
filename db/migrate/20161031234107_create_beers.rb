class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.float :price
      t.string :name
      t.references :style, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
