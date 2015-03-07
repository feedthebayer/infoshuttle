class UserSessionsController < ApplicationController
  def new
  end

  def create
    # Always remember the login
    if @user = login(params[:session][:email], params[:session][:password], true)
      redirect_back_or_to(root_path)
    else
      flash.now[:alert] = "Hmm, something seems amiss. You better double-check your credentials."
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_url)
  end
end
