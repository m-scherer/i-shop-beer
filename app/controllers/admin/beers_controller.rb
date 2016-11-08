class Admin::BeersController < Admin::BaseController

  def index
    @beers = Beer.all
  end

  def edit
    @beer = Beer.find(params[:id])
    @styles = Style.all
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(beer_params)
    if @beer.save
      flash[:success] = "#{@beer.name} updated!"
      redirect_to admin_beers_path
    else
      render :edit
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :price, :image, :style, :description, :status)

  end
end
