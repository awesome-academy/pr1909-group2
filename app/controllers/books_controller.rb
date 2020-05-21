class BooksController < ApplicationController
  before_action :list_authors, only: %i(new edit create)
  before_action :list_publishers, only: %i(new edit create)
  def show
    if (Book.find_by id: params[:id]).nil?
      flash[:danger] = "Không Tồn Tại Sách!"
      redirect_to root_path
    else
      @book = Book.find_by id: params[:id]
    end
  end

  def index
    @q = Book.ransack(params[:q])
    @books = params[:type_book].present? ? index_by_type(params[:type_book]) :
    @q.result.page(params[:page])
    @cart = current_cart
  end

  def new
    @book = Book.new
    @book.author_books.build.build_author
    @book.book_publishers.build.build_publisher
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Create book success!"
      redirect_to @book
    else
      flash[:danger] = "The data entry is missing!"
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
    params.require(:book).permit(:name, :describe, :price, :image, :type_book, author_ids: [], publisher_ids: [],
    author_books_attributes: [:id, :book_id, :author_id, author_attributes: [:id, :name, :country, :age]],
    book_publishers_attributes: [:id, :book_id, :publisher_id, publisher_attributes: [:id, :name, :address]])
  end

  def list_authors
    @authors = Author.all.map { |author| [author.name, author.id] }
  end

  def list_publishers
    @publishers = Publisher.all.map { |publisher| [publisher.name, publisher.id] }
  end
end
