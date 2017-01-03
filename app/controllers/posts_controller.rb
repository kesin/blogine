class PostsController < ApplicationController

  def index
    @posts = Post.unconcealed.includes(:tags, :column)
  end

  def show
    @post = Post.find_by_ident(params[:id])
    return render_404 unless @post && @post.public?
    @comments = @post.comments.unconcealed.includes(:children)
  end
end
