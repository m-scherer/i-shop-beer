class StylesController < ApplicationController

  def index
    @styles = Style.all
  end

  def show
    @style = Style.find_by(slug: params[:slug])
    if @style.nil?
      render file: 'public/404'
    else
      @beers = Beer.where(style: @style)
    end
  end
end
