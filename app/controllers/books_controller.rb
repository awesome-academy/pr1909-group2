class BooksController < ApplicationController
  def show
    @book = Book.find_by id: params[:id]
  end

  def index
    @books = params[:type_book].present? ? index_by_type(params[:type_book]) : Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Create book success!"
      redirect_to @book
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :describe, :price, :image, :type_book)
  end
end
