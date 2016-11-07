class OrdersController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @order = @user.orders.new
    if @order.save
      @order.create_beer_orders(cart_beers, @cart)
      clear_cart
      flash[:success] = "Placed your order!"
      redirect_to orders_path
    else
      redirect_to cart_path
    end
  end

  def show
    @user = User.find(params[:user_id])
    @order = Order.find(params[:id])
    if current_user.admin? || current_user.id == @order.user.id
      @total = @order.total_order
    else
      render file: "/public/404"
    end
  end

  def index
    @orders = current_user.user_orders
  end

end
