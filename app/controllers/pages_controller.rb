class PagesController < ApplicationController
  def show
    @page = Page.find_by_path(params[:id])
  end
end
