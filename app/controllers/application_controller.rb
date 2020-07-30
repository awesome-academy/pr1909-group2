class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :update_match_lives
  before_action :update_match_wait
  before_action :update_match_started
  before_action :update_age
  before_action :update_point
  include PlayerHelper
  include AdminHelper

  def update_match_lives
    today = DateTime.now
    @match_lives = Match.all.select { |x| x["start_match"] <= today && today <= x["end_match"] }
    @match_score_nil = @match_lives.select { |x| x["score_home"].nil? }
    @match_score_nil.map { |e| e.update(score_home: rand(0..6), score_away: rand(0..6), status: 1) }
  end

  def update_match_wait
    today = DateTime.now
    @match_score_nil = Match.all.select { |x| x["score_home"].nil? }
    @match_wait = @match_score_nil.select { |x| x["start_match"] > today }
    @match_wait.map { |e| e.update(status: 0) }
  end

  def update_match_started
    today = DateTime.now
    @match_score_present = Match.all.select { |x| x["score_home"].present? }
    @match_started = @match_score_present.select { |x| x["end_match"] < today }
    @match_started.each do |match|
      if match.status != "started"
        home_team = Team.find(match.home_team_id)
        away_team = Team.find(match.away_team_id)
        home_w = home_team.w
        away_w = away_team.w
        home_d = home_team.d
        away_d = away_team.d
        home_l = home_team.l
        away_l = away_team.l
        home_team.update(w: home_w+1) if match.score_home > match.score_away
        away_team.update(w: away_w+1) if match.score_home < match.score_away
        home_team.update(l: home_l+1) if match.score_home < match.score_away
        away_team.update(l: away_l+1) if match.score_home > match.score_away
        home_team.update(d: home_d+1) if match.score_home == match.score_away
        away_team.update(d: away_d+1) if match.score_home == match.score_away
        home_team.update(point: home_team.w * 3)
        away_team.update(point: away_team.w * 3)
        if home_team.d != 0
          home_team.update(point: home_team.point+(home_team.d * 1))
        end
        if away_team.d != 0
          away_team.update(point: away_team.point+(away_team.d * 1))
        end
        home_team.update(goals: home_team.goals + match.score_home)
        away_team.update(goals: away_team.goals + match.score_away)
      end
      match.update(status: 2)
    end
  end

  def update_point
    @players = Player.all.select{|v| v["point"] == 0}
    @players.each do |player|
      player.update(point: player.point + (player.value_money / player.age))
    end
  end

  def update_age
    today = DateTime.now
    @players = Player.all
    @players.each do |player|
      player.update(age: today.strftime("%Y").to_i - player.dob.strftime("%Y").to_i)
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs + [:remove_avatar]
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
    locale : I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = "You cannot access this page"
    end
  end
end
