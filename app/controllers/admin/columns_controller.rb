class Admin::ColumnsController < Admin::ApplicationController
  def index
    @columns = Column.all
  end
end