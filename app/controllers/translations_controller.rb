class TranslationsController < ApplicationController
  respond_to :json

  def show
    c = Cable.find_by_reference! :id
    respond_with c.translation
  end
end

