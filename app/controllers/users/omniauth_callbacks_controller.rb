class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_callback("facebook")
  end

  def google_oauth2
    generic_callback("google_oauth2")
  end

  def generic_callback(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, :event => :authentication
  end
end