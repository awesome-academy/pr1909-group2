class AwayteamsController < ApplicationController
  before_action :list_teams, only: %i(new edit create)
  def new
    @awayteam = Awayteam.new
  end

  def create
    @awayteam = Awayteam.new(awayteam_params)
    if @awayteam.save
      flash[:success] = "Create awayteam success!"
      redirect_to @awayteam
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def show
    @awayteam = Awayteam.find_by id: params[:id]
  end

  private

  def awayteam_params
    params.require(:awayteam).permit(:team_id, team_attributes: [:id, :name, :logo, :country])
  end

  def list_teams
    @teams = Team.all.map { |team| [team.name, team.id] }
  end
end
