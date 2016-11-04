class BeersController < ApplicationController

  def index
    @beers = Beer.search(params[:q])
  end

  def show
    @beer = Beer.find(params[:id])
  end

end
