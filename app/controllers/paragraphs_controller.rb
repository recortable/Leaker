class ParagraphsController < ApplicationController
  respond_to :html

  def edit
    @cable = Cable.get! params[:cable_id]
    @paragraph = @cable.paragraph params[:id]
  end
end

