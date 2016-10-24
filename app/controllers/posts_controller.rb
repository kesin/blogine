class PostsController < ApplicationController

  def index
    @posts = Post.all.includes(:tags, :column)
  end

  def show
    @post = Post.find_by_ident(params[:id])
    @comments = @post.comments.verified
  end
end
