require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest


  test "should go to leaderboard" do
    get leaderboard_url
    assert :success
  end

  test "should go to recommender page" do
    get dummypath_create_url
    get home_recommend_url
    assert :success
  end

  test "should go to be recommended page" do
    get dummypath_create_url
    get home_recommendee_url
    assert :success
  end

  test "should redirect to login because not logged in" do
    get home_url
    assert_redirected_to login_url
  end

  test "should create recommendation" do
    assert_difference('Recommendation.count') do
      get dummypath_create_url
      get home_recommendee_url
    end

    assert :success
  end

end
