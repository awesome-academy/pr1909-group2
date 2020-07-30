class PlayersController < ApplicationController
  def show
    @player = Player.find_by id: params[:id]
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
    @match_waits = @player.team.matches.select { |m| m["status"] == "wait" }
  end
end
