class Admin::UsersController < ApplicationController
  layout false, only: [:index]
  before_action :get_user, only: [:show, :update, :destroy, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      @user.update(admin: true)
      flash[:success] = "Create user success!"
      redirect_to admin_users_path
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def show
  end

  def index
    @users = User.not_admin.paginate(page: params[:page])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @admin_user_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
