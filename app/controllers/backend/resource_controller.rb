class Backend::ResourceController < Backend::ApplicationController
  layout 'backend'
  inherit_resources
  has_scope :page, default: 1
  respond_to :html
end

