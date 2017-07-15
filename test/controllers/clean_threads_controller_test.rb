require 'test_helper'

class CleanThreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clean_threads_show_url
    assert_response :success
  end

end
