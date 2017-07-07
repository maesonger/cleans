require 'test_helper'

class CleanCompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clean_company_show_url
    assert_response :success
  end

end
