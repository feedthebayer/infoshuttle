class WikisController < ApplicationController
  def show
    if params[:id] == 'home'
      params[:id] = current_user.wikis.first.id
    end

    @wiki = Wiki.find(params[:id])
  end
end
