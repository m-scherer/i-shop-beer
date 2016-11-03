module ApplicationHelper

  def cart_total
    cart_total = @cart.contents.map do |beer_id, quantity|
        beer = Beer.find(beer_id)
        beer.price * quantity
    end
      if cart_total.reduce(:+).nil?
        cart_total = 0.00
      else
        cart_total.reduce(:+).round(2)
      end
  end

  def cart_beers
    @cart.contents.map do |beer_id, quantity|
      Beer.find(beer_id)
    end
  end

  def beer_subtotal
  end
  
end
