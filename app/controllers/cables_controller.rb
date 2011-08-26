class CablesController < ApplicationController
  def index
  end

  def search
    @term = params[:term]
  end

  def show
    @cable = Cable.find_by_identifier(params[:id])
    if !@cable
      redirect_to new_cable_path(:identifier => params[:id])
    end
  end

  def new
    params[:cable] ||= {}
    params[:cable][:identifier] = params[:identifier]
    @cable = Cable.new(params[:cable])
  end
end

