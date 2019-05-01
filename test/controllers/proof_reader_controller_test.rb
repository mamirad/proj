require 'test_helper'

class ProofReaderControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get proof_reader_home_url
    assert_response :success
  end

end
