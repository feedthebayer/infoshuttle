class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @wikis = @user.wikis # owned & shared
    @new_wiki = Wiki.new
  end
end
