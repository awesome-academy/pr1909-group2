class TournamentsController < ApplicationController
	def index
  	@tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
    api_nationalitys
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      flash[:success] = "Create tournament success!"
      redirect_to @tournament
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def show
    @tournament = Tournament.find_by id: params[:id]
  end

  def destroy
    Tournament.find(params[:id]).destroy
    flash[:success] = "Tournament deleted"
    redirect_to tournaments_url
  end

  def edit
    @tournament = Tournament.find(params[:id])
    api_nationalitys
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(tournament_params)
      flash[:success] = "Tournament updated"
      redirect_to @tournament
    else
      render 'edit'
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :picture, :country)
  end
end
