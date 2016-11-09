class Admin::DashboardController < Admin::BaseController
  include DashboardHelper

  def show
    set_order
  end

  def paid
    @order = Order.find(params[:order])
    @order.Paid!
    redirect_to admin_dashboard_path
  end


  def update
    @user = User.find(current_user.id)
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
