class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :exception

  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:alert] = "You need to signin to access this page"
      return redirect_to new_user_session_path
    end
  end

  def logged_in_redirect
    if user_signed_in?
      return redirect_to town_home_index_path
    end
  end


end
