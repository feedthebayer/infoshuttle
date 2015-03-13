class UsersController < ApplicationController
  before_filter :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      reset_session
      auto_login(@user, true)
      flash[:success] = "Welcome to knowledge orbit, captain!"
      redirect_to root_path
    else
      flash.now[:alert] = "Houston, we have a problem..."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
