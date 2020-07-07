class Admin::TournamentsController < Admin::BaseController
  before_action :api_nationalitys, only: %i(new edit create show)
  def index
    @q = Tournament.ransack(params[:q])
    @tournaments = @q.result(distinct: true).paginate(page: params[:page])
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      flash[:success] = "Create tournament success!"
      redirect_to admin_tournaments_path
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def destroy
    Tournament.find(params[:id]).destroy
    flash[:success] = "Tournament deleted"
    redirect_to admin_tournaments_path
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tournament_params)
      flash[:success] = "Tournament updated"
      redirect_to admin_tournaments_path
    else
      render 'edit'
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :picture, :country)
  end
end
