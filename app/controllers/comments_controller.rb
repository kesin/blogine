class CommentsController < ApplicationController

  def create
    @post = Post.find_by_ident(params[:post_id])
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @post, notice: 'Create comment failed.' }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :html_content, :creator_name, :creator_email, :creator_site)
    end

end
