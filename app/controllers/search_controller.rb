class SearchController < ApplicationController

  before_action :enable_search, only: [:search]

  def search
    # TODO: add paginate
    return if params[:query].blank?
    @search = Post.search do
      fulltext params[:query] do
        highlight :title, :content
      end
      with(:status, 0) if current_user.blank?
    end
  end

  private

  def enable_search
    return redirect_to root_path, alert: '搜索功能未开启，请按手册配置好环境并开启搜索功能。' unless Settings.blogine.enable_search
  end

end
