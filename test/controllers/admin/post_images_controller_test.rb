require "test_helper"

class Admin::PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_images_index_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_post_images_destroy_url
    assert_response :success
  end
end
