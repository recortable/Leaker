class ParagraphsController < ApplicationController
  respond_to :html

  def edit
    @cable = Cable.get! params[:cable_id]
    @paragraph = @cable.paragraph params[:id]
  end

  def update
    @cable = Cable.get! params[:cable_id]
    paragraph = @cable.paragraph params[:id]
    paragraph.update params[:paragraph]
    respond_with @paragraph, :location => @cable
  end
end

