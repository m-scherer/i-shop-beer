class CartController < ApplicationController

  def create
    beer = Beer.find(params[:beer_id])
    @cart.add_beer(beer.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{beer.name} added to cart!"
    redirect_to style_beers_path(beer.style)
  end

  def show
  end

  def index
  end

  def remove
    cart = session[:cart]
    cart.delete(params[:id])
    flash[:success] = "Successfully removed SOME_ITEM from cart!"
    redirect_to cart_path
  end

  def destroy
  end

  def update
    @cart.contents[params[:beer]] = params[:quantity].to_i
    redirect_to cart_path
  end


end
