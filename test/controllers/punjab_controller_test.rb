require 'test_helper'

class PunjabControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get punjab_home_url
    assert_response :success
  end

end
