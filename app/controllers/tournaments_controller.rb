class TournamentsController < ApplicationController
  def show
    @tournament = Tournament.find_by id: params[:id]
    @q = Team.ransack(params[:q])
    @teams = @q.result(distinct: true).paginate(page: params[:page]).order(point: :DESC)
    @stt = 0
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end
end
