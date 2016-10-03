require 'test_helper'

class ColumnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @column = columns(:one)
  end

  test "should get index" do
    get columns_url
    assert_response :success
  end

  test "should get new" do
    get new_column_url
    assert_response :success
  end

  test "should create column" do
    assert_difference('Column.count') do
      post columns_url, params: { column: { ident: @column.ident, name: @column.name, posts_count: @column.posts_count } }
    end

    assert_redirected_to column_url(Column.last)
  end

  test "should show column" do
    get column_url(@column)
    assert_response :success
  end

  test "should get edit" do
    get edit_column_url(@column)
    assert_response :success
  end

  test "should update column" do
    patch column_url(@column), params: { column: { ident: @column.ident, name: @column.name, posts_count: @column.posts_count } }
    assert_redirected_to column_url(@column)
  end

  test "should destroy column" do
    assert_difference('Column.count', -1) do
      delete column_url(@column)
    end

    assert_redirected_to columns_url
  end
end
