# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # callback for facebook
  def facebook
    callback_for(:facebook)
  end

  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.user_profile
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      # set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      render 'users/registrations/reg_auth_view'
    end
  end

  def failure
    redirect_to root_path
  end
end
