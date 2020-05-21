class PublishersController < ApplicationController
  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:success] = "Create publisher success!"
      redirect_to @publisher
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def show
    @publisher = Publisher.find_by id: params[:id]
    @books = @publisher.books
  end

  def index
    @publishers = Publisher.all
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name, :address)
  end
end
