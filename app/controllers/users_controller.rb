class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @wikis = @user.owned_wikis
    @new_wiki = Wiki.new
  end
end
