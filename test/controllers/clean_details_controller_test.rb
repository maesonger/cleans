require 'test_helper'

class CleanDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clean_details_new_url
    assert_response :success
  end

end
