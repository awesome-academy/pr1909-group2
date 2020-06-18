class PlayersController < ApplicationController
  def show
    @player = Player.find_by id: params[:id]
  end

  def new
    @player = Player.new
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
    params.require(:player).permit(:name, :height, :weight, :shirt_number, :preferred_foot,
    :image, :diagram, :strengths, :weaknesses, :age)
  end
end
