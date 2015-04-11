class WelcomeController < ApplicationController
  def show
    if !current_user || params[:id] == "landing"
      render "landing"
    elsif params[:id] == "premium"
      render "premium"
    else
      redirect_to current_user
    end
  end
end
