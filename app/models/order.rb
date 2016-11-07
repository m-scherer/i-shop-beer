class Order < ActiveRecord::Base
  belongs_to :user
  has_many :beer_orders
  has_many :beers, through: :beer_orders

  enum order_status: [:ordered, :paid, :cancelled, :completed]

  def create_beer_orders(cart_beers, cart)
    cart_beers.each do |beer|
      beer_orders.new(beer: beer, quantity: cart.get_quantity_of_beer(beer)).save
    end
  end

  def total_order
    beers.inject(0) do |result, beer|
      result += beer.get_subtotal(self)
    end
  end

end
