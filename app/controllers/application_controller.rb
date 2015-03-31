class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to root_path, alert: "Sorry, but you must sign in first.
          If you don't have an account, you can register for free!"
  end
end
