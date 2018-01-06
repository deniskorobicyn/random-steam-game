class Users::OmniauthCallbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:steam, :failure]
  skip_before_action :verify_authenticity_token, only: [:steam, :failure]

  def steam
    @user = User.find_or_create_steam_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = "Steam" if is_navigational_format?
    else
      redirect_to root_url
    end
  end

  def failure
    redirect_to root_url
  end
end
