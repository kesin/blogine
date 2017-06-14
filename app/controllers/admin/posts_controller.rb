class Admin::PostsController < Admin::ApplicationController
  before_filter :set_post, only: [:edit, :update, :destroy]
  def index
    @posts = Post.includes(:tags, :column).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def edit
    @tags_str = @post.tags.pluck(:name).join(',')
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        if params[:post_tags].present?
          # find out exist tags and create refs
          tag_names = params[:post_tags].split(',')
          tags = Tag.where(name: tag_names)
          exist_tags_id = tags.map{|t|{tag_id: t.id}}
          @post.post_tag_refs.create(exist_tags_id)

          # get tags not exist and create with post
          exist_tags = tags.map{|t|t.name}
          unexist_tags = tag_names - exist_tags
          unexist_tags.each do |t|
            @post.tags.create(name: t)
          end
        end
        format.html { redirect_to admin_posts_path, notice: '创建成功！' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        if params[:post_tags].present?
          tag_names = params[:post_tags].split(',')
          tags = Tag.where(name: tag_names)
          post_tags = @post.tags

          # find out tags already delete from post and delete refs
          delete_refs_tag_id = (post_tags - tags).pluck(:id)
          @post.post_tag_refs.where(tag_id: delete_refs_tag_id).destroy_all

          # find out tags not exist and create with post
          exist_tags_name = tags.map{|t|t.name}
          unexist_tags_name = (tag_names - exist_tags_name).map{|t|{name: t}}
          @post.tags.create(unexist_tags_name)

          # find out tags exists but not associate to create assocition
          ready_ids = (tags - post_tags).map{|t|{tag_id: t.id}}
          @post.post_tag_refs.create(ready_ids)
        else
          @post.post_tag_refs.destroy_all
        end
        format.html { redirect_to admin_posts_path, notice: '更新成功！' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_path, notice: '删除成功！' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_ident(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :ident, :intro, :content, :html_content, :column_id, :status)
    end
end