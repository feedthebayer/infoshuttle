class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @wikis = Wiki.accessible_by(current_ability)
    @new_wiki = Wiki.new
  end
end
