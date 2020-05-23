class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def create
    @cart = current_cart
    book = Book.find(params[:book_id])
    @line_item = @cart.add_book(book.id)
    if @line_item.save
      flash[:success] = "Create cart success!"
      redirect_to @line_item.cart
    else
      render :new
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item
    else
      render :edit
    end
  end

  def destroy
    @line_item.destroy
    redirect_to line_items_url
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:book_id, :cart_id)
  end
end
