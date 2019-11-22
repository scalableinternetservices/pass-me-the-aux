require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should create fake user and login" do
    assert_difference('User.count') do
      get dummypath_create_url
    end
    assert_redirected_to home_url
  end

  test "destroy" do
    get dummypath_create_url
    get logout_url
    assert_response :redirect
  end

end
