require 'test_helper'

class CustomerServiceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_service_index_url
    assert_response :success
  end

end
