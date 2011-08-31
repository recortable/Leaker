class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :session_by_ajax

  # Set the user_id available to models (in a thread safe way)
  # Used to audit changes (see cable.audit)
  before_filter do
    Thread.current[:user_id] = session[:user_id]
  end

  # if true, the client will try to load the session information
  # using an ajax call.
  # Some urls (like root_path or search_path)
  # should load as fast as possible (and heorku needs some time
  # to warm up).
  def session_by_ajax
    @session_by_ajax ? @session_by_ajax : false
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
      flash[:error] = 'Es necesario que te identifiques primero.'
      redirect_to root_path
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

