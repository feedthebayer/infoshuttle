class UserSessionsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def destroy
    logout
    redirect_to(root_url)
  end
end
