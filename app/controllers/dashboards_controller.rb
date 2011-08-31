class DashboardsController < ApplicationController
  def index
  end

  def show
    @last_cables = Cable.all
    @last_activities = Activity.all
  end
end

