module AdminHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user_admin
    @current_user ||= User.find_by id: session[:user_id]
  end

  def active_admin(user)
  end
end
