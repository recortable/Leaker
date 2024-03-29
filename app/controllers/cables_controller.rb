class CablesController < ApplicationController
  respond_to :html

  def index
  end

  def search
    @term = params[:term]
    @session_by_ajax = true
  end

  def show
    @identifier = params[:id]
    @cable = Cable.get(params[:id])
    @translation = @cable.translation if @cable
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

