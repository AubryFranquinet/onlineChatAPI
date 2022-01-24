require "test_helper"

class RootUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @root_user = root_users(:one)
  end

  test "should get index" do
    get root_users_url, as: :json
    assert_response :success
  end

  test "should create root_user" do
    assert_difference("RootUser.count") do
      post root_users_url, params: { root_user: { password: "secret", password_confirmation: "secret", username: @root_user.username } }, as: :json
    end

    assert_response :created
  end

  test "should show root_user" do
    get root_user_url(@root_user), as: :json
    assert_response :success
  end

  test "should update root_user" do
    patch root_user_url(@root_user), params: { root_user: { password: "secret", password_confirmation: "secret", username: @root_user.username } }, as: :json
    assert_response :success
  end

  test "should destroy root_user" do
    assert_difference("RootUser.count", -1) do
      delete root_user_url(@root_user), as: :json
    end

    assert_response :no_content
  end
end
