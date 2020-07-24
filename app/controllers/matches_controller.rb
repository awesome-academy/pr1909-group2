class MatchesController < ApplicationController
  before_action :list_teams, only: %i(new edit create)

  def show
    @match = Match.find_by id: params[:id]
  end

  private

  def list_teams
    @teams = Team.all.map { |team| [team.name, team.id] }
  end
end
