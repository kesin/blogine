class Admin::PagesController < Admin::ApplicationController
  def index
    @pages = Post.where(status: 100)
  end
end