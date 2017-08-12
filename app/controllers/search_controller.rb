class SearchController < ApplicationController

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

end
