require 'test_helper'

class CartrigeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cartrige_index_url
    assert_response :success
  end

end
