module BeersHelper
  def cart_row_subtotal(beer)
    number_to_currency(@cart.contents[beer.id.to_s] * beer.price)
  end
end
