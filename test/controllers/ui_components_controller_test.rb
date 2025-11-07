require "test_helper"

class UiComponentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ui_components_index_url
    assert_response :success
  end
end
