require 'test_helper'

class PrintersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get printers_index_url
    assert_response :success
  end

  test "should get show" do
    get printers_show_url
    assert_response :success
  end

  test "should get new" do
    get printers_new_url
    assert_response :success
  end

end
