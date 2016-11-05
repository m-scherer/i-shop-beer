class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_cart

  helper_method :get_total, :logged_in?, :current_user, :cart_beers, :current_admin?

  def set_cart
    @styles = Style.all
    @cart = Cart.new(session[:cart])
  end

  def get_total
    @cart.total
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def cart_beers
    @cart.contents.map do |beer_id, quantity|
      Beer.find(beer_id)
    end
  end

  def clear_cart
    session[:cart] = {}
  end

  def current_admin?
    current_user && current_user.admin?
  end

end
