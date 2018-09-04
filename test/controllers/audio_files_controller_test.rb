require 'test_helper'

class audiofilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get audio_files_new_url
    assert_response :success
  end

  test "should get create" do
    get audio_files_create_url
    assert_response :success
  end

  test "should get destroy" do
    get audio_files_destroy_url
    assert_response :success
  end

end
