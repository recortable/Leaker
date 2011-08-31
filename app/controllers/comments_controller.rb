# encoding: utf-8

class CommentsController < ApplicationController
  respond_to :html

  before_filter do
    @cable = Cable.get! params[:cable_id]
  end

  def new
    redirect_to @cable, error: 'Sólo se pueden comentar párrafos' if params[:paragraph].blank?
    @paragraph = @cable.paragraph params[:paragraph]
    @comment = Comment.new(identifier: @cable.identifier,
      paragraph_id: @paragraph.id)
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.save
    respond_with @comment, :location => @comment.cable
  end

end

