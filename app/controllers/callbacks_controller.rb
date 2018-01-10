class CallbacksController < Devise::OmniauthCallbacksController
  def social_media
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  alias :twitter :social_media
  alias :facebook :social_media
  alias :vkontakte :social_media
  alias :google_oauth2 :social_media

end