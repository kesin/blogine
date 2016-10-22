class Admin::TagsController < Admin::ApplicationController
  def index
    @tags = Tag.all
  end
end