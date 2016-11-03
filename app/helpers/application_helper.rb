module ApplicationHelper

  def cart_total
    cart_total = @cart.contents.map do |beer_id, quantity|
        beer = Beer.find(beer_id)
        beer.price * quantity
    end
    cart_total.reduce(:+)
  end

end
