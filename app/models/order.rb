class Order < ActiveRecord::Base
  belongs_to :user
  has_many :beer_orders
  has_many :beers, through: :beer_orders
end
