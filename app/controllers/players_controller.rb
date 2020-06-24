class PlayersController < ApplicationController
  before_action :list_teams, only: %i(new edit create)
  before_action :api_nationalitys, only: %i(new edit create)
  def show
    @player = Player.find_by id: params[:id]
  end

  def new
    @player = Player.new
    @player.build_team
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "Create player success!"
      redirect_to @player
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :nationality, :height, :weight, :shirt_number, :preferred_foot,
    :image, :diagram, :strengths, :weaknesses, :age, :team_id, team_attributes: [:id, :name, :logo, :country])
  end

  def list_teams
    @teams = Team.all.map{ |team| [team.name, team.id] }
  end
end
