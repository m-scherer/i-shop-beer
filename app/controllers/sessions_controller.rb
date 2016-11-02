class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      flash[:danger] = "Please enter a valid email!"
      render :new
    elsif @user && @user.authenticate(params[:password]) == false
      flash[:danger] = "Password invalid!"
      render :new
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to beers_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end
end
