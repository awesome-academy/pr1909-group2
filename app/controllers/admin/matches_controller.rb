class Admin::MatchesController < Admin::BaseController
  before_action :list_teams, only: %i(new edit create index)
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:success] = "Create match success!"
      redirect_to admin_matches_path
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def index
    @q = Match.ransack(params[:q])
    @matches = @q.result(distinct: true).paginate(page: params[:page])
  end

  def destroy
    Match.find(params[:id]).destroy
    flash[:success] = "Match deleted"
    redirect_to admin_matches_url
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:success] = "Profile updated"
      redirect_to admin_matches_path
    else
      render 'edit'
    end
  end

  private

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :start_match, :end_match)
  end

  def list_teams
    @teams = Team.all.map { |team| [team.name, team.id] }
  end
end
