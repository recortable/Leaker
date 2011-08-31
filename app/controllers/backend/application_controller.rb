class Backend::ApplicationController < ApplicationController
  protect_from_forgery
  before_filter :require_user

end

