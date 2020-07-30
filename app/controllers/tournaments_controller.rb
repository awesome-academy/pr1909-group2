class TournamentsController < ApplicationController
  def show
    @tournament = Tournament.find_by id: params[:id]
    @teams = @tournament.teams.order(point: :DESC, goals: :DESC)
    @stt = 0
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
    @match_waits = @tournament.matches.wait.order(start_match: :ASC)
  end
end
