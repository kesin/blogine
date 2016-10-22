class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.all
  end
end