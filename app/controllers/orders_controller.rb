class OrdersController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @order = Order.new(user: @user)
    if @order.save
      flash[:success] = "Placed your order!"
      redirect_to user_order_path(@user, @order)
    else
      redirect_to cart_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

end
