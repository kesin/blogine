class PagesController < ApplicationController
  def show
    @page = Page.find_by_ident(params[:id])
    @comments = @page.comments.verified
  end
end
