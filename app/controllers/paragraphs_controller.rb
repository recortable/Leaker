class ParagraphsController < ApplicationController
  respond_to :html

  def edit
    @cable = Cable.get! params[:cable_id]
    @paragraph = @cable.paragraph params[:id]
  end

  def update
    @cable = Cable.get! params[:cable_id]
    paragraph = @cable.paragraph params[:id]
    paragraph.update params[:paragraph] unless spam?
    respond_with @paragraph, :location => cable_path(@cable,
      anchor: "paragraph-#{paragraph.id}")
  end
end

