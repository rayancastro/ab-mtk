require 'test_helper'

class SegmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get segments_show_url
    assert_response :success
  end

end
