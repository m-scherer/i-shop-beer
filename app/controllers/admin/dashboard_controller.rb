class Admin::DashboardController < Admin::BaseController


  def show
    if params[:status] == "ordered"
      @orders = Order.where(order_status: 0)
    elsif params[:status] == "paid"
      @orders = Order.where(order_status: 1)
    elsif params[:status] == "cancelled"
      @orders = Order.where(order_status: 2)
    elsif params[:status] == "completed"
      @orders = Order.where(order_status: 3)
    else
      @orders = Order.all
    end
  end

    def update
      @order = Order.find(params[:order])
      byebug
    end

end
