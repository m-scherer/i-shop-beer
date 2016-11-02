class CartController < ApplicationController

  def create
    beer = Beer.find(params[:beer_id])
    @cart.add_beer(beer.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{beer.name} added to cart!"
    redirect_to style_beers_path(beer.style)
  end

  def show
    cart = session[:cart]
    @beers = Beer.find()
  end

  def index
  end


end
