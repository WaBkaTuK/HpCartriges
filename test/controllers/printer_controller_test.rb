require 'test_helper'

class PrinterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get printer_index_url
    assert_response :success
  end

end
