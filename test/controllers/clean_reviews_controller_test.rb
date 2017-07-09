require 'test_helper'

class CleanReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clean_reviews_show_url
    assert_response :success
  end

  test "should get create" do
    get clean_reviews_create_url
    assert_response :success
  end

  test "should get new" do
    get clean_reviews_new_url
    assert_response :success
  end

end
