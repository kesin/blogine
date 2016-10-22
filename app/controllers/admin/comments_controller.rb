class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = []
  end
end