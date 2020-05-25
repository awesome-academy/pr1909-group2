class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = current_cart.order.build order_params
    if @order.save
      flash[:success] = "Create order success!"
      redirect_to cart_path(current_cart)
    else
      render :new
    end
  end

  def show
    @cart = current_cart.line_items
    if current_user&.admin?
      @orders_active = Order.all
    else
      @orders_active = current_cart.order.where(status: "Đã Giao")
    end
  end

  def index
    @cart = current_cart.line_items
    if current_user&.admin?
      @orders = Order.all
    else
      @orders = current_cart.order.where(status: "Đang Giao")
    end
  end

  def active
    order = Order.find params[:order_id]
    order.update(status: "Đã Giao")
    redirect_to root_path
    flash[:success] = "Active Success!"
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_type)
  end
end
