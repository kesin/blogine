class PagesController < ApplicationController
  def show
    @page = Page.find_by_path(params[:id])
    return render_404 unless @page && @page.public?
    @comments = @page.comments.unconcealed.includes(:children)
  end
end
