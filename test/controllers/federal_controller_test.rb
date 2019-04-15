require 'test_helper'

class FederalControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get federal_home_url
    assert_response :success
  end

end
