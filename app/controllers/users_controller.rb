class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.now[:success] = "Welcome to knowledge orbit, captain!"
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
