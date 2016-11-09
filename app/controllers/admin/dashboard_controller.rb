class Admin::DashboardController < Admin::BaseController


  def show
    if params[:status] == "Ordered"
      @orders = Order.where(order_status: 0)
    elsif params[:status] == "Paid"
      @orders = Order.where(order_status: 1)
    elsif params[:status] == "Cancelled"
      @orders = Order.where(order_status: 2)
    elsif params[:status] == "Completed"
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
