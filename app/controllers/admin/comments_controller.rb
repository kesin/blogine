class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = Comment.all.order('created_at DESC').page(params[:page])
  end

  # reply comment for admin
  def create

  end

  # check comment valid or not
  def update
    @comment = Comment.find_by_id(params[:id])
    @comment.update_column(:status, params[:status])
    respond_to do |format|
      format.js
    end
  end

  # delete comment
  def destroy
    @comment = Comment.find_by_id(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end
end