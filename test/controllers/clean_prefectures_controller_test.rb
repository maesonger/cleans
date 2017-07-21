require 'test_helper'

class CleanPrefecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clean_prefectures_new_url
    assert_response :success
  end

  test "should get create" do
    get clean_prefectures_create_url
    assert_response :success
  end

end
