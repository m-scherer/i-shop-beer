class Admin::UsersController < Admin::BaseController

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    if @user.save
      flash[:success] = "Account for #{@user.email} updated!"
      redirect_to admin_dashboard_path
    else
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :address)
  end


end
