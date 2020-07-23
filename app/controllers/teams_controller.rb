class TeamsController < ApplicationController
  def show
    @team = Team.find_by id: params[:id]
    @players = @team.players
    @matchs = @team.matches.select { |x| x["status"] == "wait" }
  end
end
