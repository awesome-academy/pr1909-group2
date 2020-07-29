class TeamsController < ApplicationController
  def show
    @team = Team.find_by id: params[:id]
    @players = @team.players
    @matchs = @team.matches.select { |x| x["status"] == "wait" }
    @tournament = @team.tournament
    @q = Team.ransack(params[:q])
    @teams = @q.result(distinct: true).paginate(page: params[:page]).order(point: :DESC)
    @stt = 0
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end
end
