class Admin::SessionsController < ApplicationController
  layout false, only: [:new]

  def create
    @user = User.where("admin", true).find_by email: params[:session][:email].downcase
    if @user && @user.admin?
      log_in @user
      redirect_to admin_path
    else
      flash[:alert] = "Email is not admin"
      redirect_to admin_login_path
    end
  end

  def destroy
    log_out
    redirect_to admin_login_path
  end
end
