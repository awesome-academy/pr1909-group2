class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = current_cart.order.build order_params
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      flash[:success] = "Create order success!"
      redirect_to cart_path(current_cart)
    else
      render :new
    end
  end

  def index
    @orders = Order.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_type)
  end
end
