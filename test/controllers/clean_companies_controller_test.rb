require 'test_helper'

class CleanCompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clean_companies_show_url
    assert_response :success
  end

end
