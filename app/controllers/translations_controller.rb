class TranslationsController < ApplicationController
  respond_to :html

  def edit
    @translation = Translation.find params[:id]
    @cable = @translation.cable
  end

  def update
    @translation = Translation.find params[:id]
    @translation.update_info params[:translation]
    respond_with @translation, :location => @translation.cable
  end
end

