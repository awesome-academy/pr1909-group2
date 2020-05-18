class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Create author success!"
      redirect_to @author
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def show
    @author = Author.find_by id: params[:id]
    @books = @author.books
  end

  def index
    @authors = Author.all
  end

  private

  def author_params
    params.require(:author).permit(:name, :age, :country)
  end
end
