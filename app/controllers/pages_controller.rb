class PagesController < ApplicationController
  def show
    @page = Page.find_by_path(params[:id])
    return render_404 unless @page
    @comments = @page.comments.unconcealed
  end
end
