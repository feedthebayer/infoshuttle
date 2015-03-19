class PagesController < ApplicationController
  def show
    if params[:id] == 'landing'
      render 'landing'
    end
  end
end
