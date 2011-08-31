# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :session_by_ajax

  self.responder = Responder

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

  # Retrieve the current session user, if any
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  # Store the current user in the session
  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  # To be used as before_filter
  def require_user
    unless current_user
      store_location
      flash[:error] = 'Es necesario que te identifiques primero.'
      redirect_to root_path
    end
  end

  # Simple anti-spam method: check if some fake required
  # form parameter is present (the form field is hidden by css)
  def spam?
    params[:email].present?
  end

end

