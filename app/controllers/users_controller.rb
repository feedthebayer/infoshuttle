class UsersController < ApplicationController
  before_filter :require_login

  def show
    @user = current_user
    @wikis = @user.wikis
  end
end
