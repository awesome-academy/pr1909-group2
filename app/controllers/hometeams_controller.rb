class HometeamsController < ApplicationController
  before_action :list_teams, only: %i(new edit create)
  def new
    @hometeam = Hometeam.new
  end

  def create
  byebug
    @hometeam = Hometeam.new(hometeam_params)
    if @hometeam.save
      flash[:success] = "Create hometeam success!"
      redirect_to @hometeam
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def show
    @hometeam = Hometeam.find_by id: params[:id]
  end

  private

  def hometeam_params
    params.require(:hometeam).permit(:team_id, team_attributes: [:id, :name, :logo, :country])
  end

  def list_teams
    @teams = Team.all.map { |team| [team.name, team.id] }
  end
end
