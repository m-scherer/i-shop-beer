module BeersHelper


  def beer_subtotal
    beer_subtotal = @cart.contents.map do |beer_id, quantity|
      beer = Beer.find(beer_id)
      beer.price * quantity
    end
      if beer_subtotal.reduce(:+).nil?
        beer_subtotal = 0.00
      else
        beer_subtotal.reduce(:+).round(2)
      end
  end

end
