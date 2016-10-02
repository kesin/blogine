require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get sessions_new,_url
    assert_response :success
  end

  test "should get create," do
    get sessions_create,_url
    assert_response :success
  end

  test "should get destroy" do
    get sessions_destroy_url
    assert_response :success
  end

end
