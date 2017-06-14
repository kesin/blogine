class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by_name(params[:id])
    @posts = @tag.posts.includes(:tags, :column).page(params[:page]).per(8)
  end

end
