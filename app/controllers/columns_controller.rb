class ColumnsController < ApplicationController

  # GET /columns
  # GET /columns.json
  def index
    @columns = Column.all
  end

  # GET /columns/1
  # GET /columns/1.json
  def show
    @column = Column.find_by_ident(params[:id])
    @posts = @column.posts.includes(:tags)
  end
end
