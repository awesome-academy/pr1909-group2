class MatchesController < ApplicationController
  before_action :list_teams, only: %i(new edit create)
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:success] = "Create match success!"
      redirect_to @match
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def show
    @match = Match.find_by id: params[:id]
  end

  private

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :start_match, :end_match)
  end

  def list_teams
    @teams = Team.all.map { |team| [team.name, team.id] }
  end
end
