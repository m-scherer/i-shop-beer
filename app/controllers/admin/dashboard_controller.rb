class Admin::DashboardController < Admin::BaseController

  def show
    @orders = Order.all
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
  end

end
