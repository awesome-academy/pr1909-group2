class TeamsController < ApplicationController
  def index
  	@teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Create team success!"
      redirect_to @team
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def show
    @team = Team.find_by id: params[:id]
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team deleted"
    redirect_to teams_url
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:success] = "football team updated"
      redirect_to @team
    else
      render 'edit'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :image, :country)
  end
end
