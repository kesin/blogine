class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = Comment.all
  end

  # reply comment for admin
  def create

  end

  # check comment valid or not
  def update

  end

  # delete comment
  def destroy

  end
end