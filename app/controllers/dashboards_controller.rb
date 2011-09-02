class DashboardsController < ApplicationController
  def index
    @session_by_ajax = true
    response.headers['Cache-Control'] = 'public, max-age=30000'
  end

  def show
    @cables_count = Cable.count
    @last_cables = Cable.limit(10)
    @last_activities = Activity.limit(10)
  end
end

