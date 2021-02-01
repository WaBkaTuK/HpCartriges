require 'test_helper'

class CartrigesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cartriges_index_url
    assert_response :success
  end

  test "should get show" do
    get cartriges_show_url
    assert_response :success
  end

  test "should get new" do
    get cartriges_new_url
    assert_response :success
  end

end
