require 'test_helper'

class TeenagersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teenagers_new_url
    assert_response :success
  end

end
