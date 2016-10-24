require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { content: @comment.content, creator_email: @comment.creator_email, creator_name: @comment.creator_name, creator_site: @comment.creator_site, html_content: @comment.html_content, post_id: @comment.post_id, status: @comment.status } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { content: @comment.content, creator_email: @comment.creator_email, creator_name: @comment.creator_name, creator_site: @comment.creator_site, html_content: @comment.html_content, post_id: @comment.post_id, status: @comment.status } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
