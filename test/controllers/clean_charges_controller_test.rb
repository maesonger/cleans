require 'test_helper'

class CleanChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clean_charges_new_url
    assert_response :success
  end

end
