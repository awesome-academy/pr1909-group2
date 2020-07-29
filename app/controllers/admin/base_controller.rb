class Admin::BaseController < ApplicationController
  layout false
  layout "admin"
  def index
    @users = User.all
    @players = Player.all
    @teams = Team.all
    @tournaments = Tournament.all
    @matchs = Match.all
  end
end
