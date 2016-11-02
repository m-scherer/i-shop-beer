class AddDescriptionAndImageToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :description, :string
    add_column :beers, :image, :string
  end
end
