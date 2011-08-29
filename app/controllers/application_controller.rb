class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    Thread.current[:user_id] = session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = 'Es necesario que te identifiques primero.'
      redirect_to login_path
    end
  end

  def store_location(location = nil)
    location ||= request.fullpath
    session[:return_to] = location
  end

  def stored_or(default_path)
    path = session[:return_to] || default_path
    session[:return_to] = nil
    path
  end
end

