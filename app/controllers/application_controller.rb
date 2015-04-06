class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      flash[:alert] = "Uh oh, you aren't allowed to do that :/"
    else
      flash[:alert] = "Uh oh, you aren't allowed to do that.
                       Sign in and try again."
    end
    # redirect_to :back
    redirect_to root_path
  end

  private

  def not_authenticated
    redirect_to root_path, alert: "Sorry, but you must sign in first.
          If you don't have an account, you can register for free!"
  end
end
