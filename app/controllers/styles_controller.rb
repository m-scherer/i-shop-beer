class StylesController < ApplicationController

  def index
    @styles = Style.all
  end

  def show
    @style = Style.find_by(slug: params[:slug])
    if @style.nil?
      redirect_to 'public/404.html'
    else
      @beers = Beer.where(style: @style)
    end
  end
end
