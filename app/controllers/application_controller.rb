class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  # == Currently a user can bypass the login page with a direct url.
  #    Need to verify authentication

  # before_filter :authenticate

  # def authenticate
  #   redirect_to :login unless User.find_by_provider_and_uid(auth["provider"], auth["uid"])
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #redirect_to :login unless @current_user
  end
end
