class StaticPagesController < ApplicationController
  def home
    @match_waits = Match.wait
  end

  def match_live
    @match_lives = Match.live
  end

  def match_started
    @match_starteds = Match.started
  end
end
