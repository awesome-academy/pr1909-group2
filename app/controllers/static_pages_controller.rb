class StaticPagesController < ApplicationController
  def home
    @q = Match.wait.ransack(params[:q])
    @match_waits = @q.result(distinct: true).paginate(page: params[:page]).select { |x| x["start_match"].strftime("%m/%d/%Y") == Date.today.strftime("%m/%d/%Y") }
    @tournaments = Tournament.all
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end

  def match_live
    @q = Match.live.ransack(params[:q])
    @match_lives = @q.result(distinct: true).paginate(page: params[:page]).order(start_match: :ASC)
    @tournaments = Tournament.all
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end

  def match_started
    @q = Match.started.ransack(params[:q])
    @match_starteds = @q.result(distinct: true).paginate(page: params[:page]).order(start_match: :ASC)
    @tournaments = Tournament.all
    @top_players = Player.paginate(:page => params[:page], :per_page => 7).order(point: :DESC)
  end
end
