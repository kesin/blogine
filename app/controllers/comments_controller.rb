class CommentsController < ApplicationController

  def create
    if params[:post_id].present?
      @target = Post.find_by_ident(params[:post_id])
    elsif params[:page_id].present?
      @target = Page.find_by_path(params[:page_id])
    end
      @comment = @target.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @target, notice: '评论成功，将在审核通过后显示 :p' }
      else
        Rails.logger.info @comment.errors.full_messages
        format.html { redirect_to @target, notice: '评论失败，请稍后再试 :(' }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :html_content, :creator_name, :creator_email, :creator_site)
    end

end
