class Admin::PagesController < Admin::ApplicationController
  before_filter :set_page, only: [:edit, :update, :destroy]

  def index
    @pages = Page.all.includes(:comments).page(params[:page])
  end

  def new
    @page = Page.new
  end

  def edit

  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_pages_path, notice: '创建成功！' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_pages_path, notice: '更新成功！' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_path, notice: '删除成功！' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find_by_path(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:page).permit(:title, :path, :content, :html_content, :status)
  end
end