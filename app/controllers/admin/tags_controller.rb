class Admin::TagsController < Admin::ApplicationController
  before_action :set_tag, only: [:destroy]

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      @tag.save
      format.js
    end
  end

  def update_tag
    @tag = Tag.find_by_id(params[:id])
    if @tag.update(tag_params)
      render json: {status: 1, message: '更新成功!', data: {path: tag_path(@tag)}}
    else
      render json: {status: 0, message: @tag.errors}
    end
  end

  def destroy
    @tag = @tag.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find_by_name(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end