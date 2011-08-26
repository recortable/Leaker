class CablesController < ApplicationController
  respond_to :html

  def index
    @last_cables = Cable.all
  end

  def search
    @term = params[:term]
  end

  def show
    @identifier = params[:id]
    @cable = Cable.find_by_identifier(params[:id])
  end

  def new
    params[:cable] ||= {}
    params[:cable][:identifier] = params[:identifier]
    @cable = Cable.new(params[:cable])
  end

  def create
    @cable = Cable.new(params[:cable])
    @cable.save
    respond_with @cable
  end
end

