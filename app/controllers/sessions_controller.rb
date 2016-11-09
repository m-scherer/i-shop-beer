class SessionsController < ApplicationController
  include SessionsHelper

  def new

  end

  def create
    user_action
  end

  def destroy
    session.clear
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end
end
