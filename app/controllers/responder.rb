# app/controllers/backend/responder.rb
class Responder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder

  def initialize(*)
    super
    @flash_now = :on_failure
  end

end

