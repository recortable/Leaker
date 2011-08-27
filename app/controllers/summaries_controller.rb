class SummariesController < ApplicationController
  respond_to :html

  def edit
    @translation = Translation.find params[:translation_id]
    @cable = @translation.cable
  end

  def update
    @translation = Translation.find params[:translation_id]
    @translation.update_attribute(:summary, params[:translation][:summary])
    respond_with @translation, :location => @translation.cable
  end
end

