class PostsController < ApplicationController

  before_filter :post, only: [:show]
  before_filter :authenticate_read_post, only: [:show]

  def index
    @posts = Post.releases
    @posts = @posts.unconcealed if current_user.blank?
    @posts = @posts.sorted_by_created.includes(:tags, :column).page(params[:page]).per(8)
  end

  def show
    @comments = @post.comments.unconcealed.includes(:children)
  end

  private

  def post
    @post = Post.find_by_ident(params[:id])
    return render_404 if @post.blank?
  end

  def authenticate_read_post
    return render_404 unless @post.public? || (@post.private? && current_user.present?)
  end

end
