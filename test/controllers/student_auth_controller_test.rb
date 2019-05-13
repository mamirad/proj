require 'test_helper'

class StudentAuthControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get student_auth_home_url
    assert_response :success
  end

end
