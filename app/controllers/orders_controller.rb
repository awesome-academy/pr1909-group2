class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @orders = current_cart.order.build order_params
    if @orders.save
      flash[:success] = "Create order success!"
      redirect_to '/'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address , :pay_type)
  end
end
