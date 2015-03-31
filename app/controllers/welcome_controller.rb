class WelcomeController < ApplicationController
  def show
    if !current_user || params[:id] == "landing"
      render "landing"
    else
      redirect_to current_user
    end
  end
end
