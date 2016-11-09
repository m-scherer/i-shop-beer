module DashboardHelper

  def set_order
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

end
