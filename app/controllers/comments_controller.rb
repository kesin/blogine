class CommentsController < ApplicationController

  def create
    unless verify_rucaptcha?(nil, keep_session: true)
      return @wrong_captcha = true
    end
    if params[:post_id].present?
      @target = Post.find_by_ident(params[:post_id])
    elsif params[:page_id].present?
      @target = Page.find_by_path(params[:page_id])
    end
    @comment = @target.comments.new(comment_params)
    @comment.status = 2 if current_user

    respond_to do |format|
      @comment.save
      format.js
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :html_content, :creator_name, :creator_email, :creator_site, :parent_id)
    end

end
