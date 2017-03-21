require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get history" do
    get user_history_url
    assert_response :success
  end

  test "should get yourRooms" do
    get user_yourRooms_url
    assert_response :success
  end

  test "should get offers" do
    get user_offers_url
    assert_response :success
  end

  test "should get show" do
    get user_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_edit_url
    assert_response :success
  end

  test "should get new" do
    get user_new_url
    assert_response :success
  end

end
