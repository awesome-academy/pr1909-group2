class PlayersController < ApplicationController
  def show
    @player = Player.find_by id: params[:id]
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end
end
