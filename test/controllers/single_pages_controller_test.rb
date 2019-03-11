require 'test_helper'

class SinglePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get single_pages_contact_url
    assert_response :success
  end

end
