class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_auth auth
    session[:user_id] = user.id
    redirect_to root_path
  end
end

