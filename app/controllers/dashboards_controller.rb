class DashboardsController < ApplicationController
  def index
    @session_by_ajax = true
  end

  def show
    @last_cables = Cable.all
    @last_activities = Activity.all
  end
end

