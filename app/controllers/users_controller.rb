class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @wikis = @user.wikis.accessible_by(current_ability)
    @new_wiki = Wiki.new
  end
end
