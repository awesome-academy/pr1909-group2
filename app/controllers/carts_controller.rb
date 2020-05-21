class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    flash[:success] = "Cart clear!"
    redirect_to carts_url
  end

  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end
end
