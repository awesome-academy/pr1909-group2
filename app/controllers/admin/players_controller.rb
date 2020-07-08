class Admin::PlayersController < Admin::BaseController
  before_action :list_teams, only: %i(new edit create)
  before_action :api_nationalitys, only: %i(new edit create edit)
  def index
    @q = Player.ransack(params[:q])
    @players = @q.result(distinct: true).paginate(page: params[:page])
  end

  def destroy
    Player.find(params[:id]).destroy
    flash[:success] = "Player deleted"
    redirect_to admin_players_url
  end

  def new
    @player = Player.new
    @player.build_team
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "Create player success!"
      redirect_to admin_players_path
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      flash[:success] = "Profile updated"
      redirect_to admin_players_path
    else
      render 'edit'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :nationality, :height, :weight, :shirt_number, :preferred_foot,
    :image, :diagram, :strengths, :weaknesses, :age, :point, :team_id, team_attributes: [:id, :name, :logo, :country])
  end

  def list_teams
    @teams = Team.all.map { |team| [team.name, team.id] }
  end
end
