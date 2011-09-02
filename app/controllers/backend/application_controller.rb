# encoding: utf-8

class Backend::ApplicationController < ApplicationController
  protect_from_forgery
  before_filter :require_admin

  protected
  def require_admin
    unless current_user || current_user.admin?
      flash[:error] = 'Sólo para administradorxs...'
      redirect_to root_path
    end
  end

end

