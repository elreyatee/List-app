class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_user #makes these methods avail to all controllers

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = 'Please log in'
      redirect_to login_path
    end
  end

  # def parse_geocode(str)
  #   newstr = str.gsub(/[^0-9.-]/, ' ').split
  #   newstr.collect {|l| l.to_f }
  # end
end
