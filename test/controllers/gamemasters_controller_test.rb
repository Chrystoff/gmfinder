require "test_helper"

class GamemastersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gamemasters_index_url
    assert_response :success
  end

  test "should get show" do
    get gamemasters_show_url
    assert_response :success
  end
end
