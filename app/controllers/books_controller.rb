class BooksController < ApplicationController
  def show
    if (Book.find_by id: params[:id]).nil?
      flash[:danger] = "Không Tồn Tại Sách!"
      redirect_to root_path
    else
      @book = Book.find_by id: params[:id]
    end
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

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Profile updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:name, :describe, :price, :image, :type_book)
  end
end
