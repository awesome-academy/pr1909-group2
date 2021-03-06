class Admin::TeamsController < Admin::BaseController
  before_action :api_nationalitys, only: %i(new edit create show)
  before_action :list_tournaments, only: %i(new edit create edit)
  def index
    @q = Team.ransack(params[:q])
    @teams = @q.result(distinct: true).paginate(page: params[:page])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Create team success!"
      redirect_to admin_teams_path
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team deleted"
    redirect_to admin_teams_url
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:success] = "football team updated"
      redirect_to admin_teams_path
    else
      render 'edit'
    end
  end

  private
  def list_tournaments
    @tournaments = Tournament.all.map { |tournament| [tournament.name, tournament.id] }
  end
  def team_params
    params.require(:team).permit(:name, :logo, :tournament_id)
  end
end
