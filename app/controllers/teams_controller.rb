class TeamsController < ApplicationController
  def show
    @team = Team.find_by id: params[:id]
    @players = @team.players
  end
end
