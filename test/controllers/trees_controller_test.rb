require 'test_helper'

class TreesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trees_index_url
    assert_response :success
  end

  test "should get new" do
    get trees_new_url
    assert_response :success
  end

  test "should get show" do
    get trees_show_url
    assert_response :success
  end

  test "should get edit" do
    get trees_edit_url
    assert_response :success
  end

end
