class StaticPagesController < ApplicationController
  def home
    @match_waits = Match.wait.select { |x| x["start_match"].strftime("%m/%d/%Y") == Date.today.strftime("%m/%d/%Y") }
    @tournaments = Tournament.all
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end

  def match_live
    @match_lives = Match.live
    @tournaments = Tournament.all
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end

  def match_started
    @match_starteds = Match.started
    @tournaments = Tournament.all
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end
end
