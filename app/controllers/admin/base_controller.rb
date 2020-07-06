class Admin::BaseController < ApplicationController
  layout false, only: [:index]
  def index
    @users = User.all
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = "You cannot access this page"
    end
  end
end
