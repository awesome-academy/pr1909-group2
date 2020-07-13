class MatchesController < ApplicationController
  before_action :list_teams, only: %i(new edit create)
  def new
    @match = Match.new
    @match.build_hometeam
    @match.build_awayteam
  end

  def create
    byebug
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
    params.require(:match).permit(:hometeam_id, :awayteam_id, hometeam_attributes: [:id, :team_id], awayteam_attributes: [:id, :team_id])
  end

  def list_teams
    @teams = Team.all.map { |team| [team.name, team.id] }
  end
end
