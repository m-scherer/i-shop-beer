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

    def paid
      @order = Order.find(params[:order])
      @order.Paid!
      redirect_to admin_dashboard_path
    end

    def cancel
      @order = Order.find(params[:order])
      @order.Cancelled!
      redirect_to admin_dashboard_path
    end

    def complete
      @order = Order.find(params[:order])
      @order.Completed!
      redirect_to admin_dashboard_path
    end

end
