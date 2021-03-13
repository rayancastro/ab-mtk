require 'test_helper'

class AbTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ab_tests_index_url
    assert_response :success
  end

  test "should get new" do
    get ab_tests_new_url
    assert_response :success
  end

  test "should get show" do
    get ab_tests_show_url
    assert_response :success
  end

end
