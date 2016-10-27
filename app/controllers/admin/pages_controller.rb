class Admin::PagesController < Admin::ApplicationController
  def index
    @pages = Page.all
  end
end