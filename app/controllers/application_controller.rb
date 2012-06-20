class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  
  def should_be_logged_in
    if !current_user
      redirect_to root_path, :notice => "You are not logged in"
    end
  end


  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



end
