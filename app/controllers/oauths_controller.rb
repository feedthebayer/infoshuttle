class OauthsController < ApplicationController
  # Sends user on a trip to the provider with a callback_url
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider, true)
      flash[:success] = "Welcome to knowledge orbit, captain!"
      redirect_to root_path
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user, true)
        flash[:success] = "Welcome to knowledge orbit, captain!"
        redirect_to root_path
      rescue
        flash[:alert] = "We're really sorry, but we couldn't authenticate
                          with #{provider.titleize}"
        redirect_to root_path
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
