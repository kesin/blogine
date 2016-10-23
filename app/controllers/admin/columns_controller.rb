class Admin::ColumnsController < Admin::ApplicationController
  before_action :set_column, only: [:destroy]

  def index
    @columns = Column.all
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)

    respond_to do |format|
      @column.save
      format.js
    end
  end

  def update_column
    @column = Column.find_by_id(params[:id])
    if @column.update(column_params)
      render json: {status: 1, message: '更新成功!', data: {path: column_path(@column)}}
    else
      render json: {status: 0, message: @column.errors}
    end
  end

  def destroy
    @column = @column.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_column
    @column = Column.find_by_ident(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def column_params
    params.require(:column).permit(:name, :ident)
  end

end