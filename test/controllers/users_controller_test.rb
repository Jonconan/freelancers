require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { area: @user.area, birthday: @user.birthday, crypted_password: @user.crypted_password, del_flg: @user.del_flg, email: @user.email, facebook_id: @user.facebook_id, github_id: @user.github_id, is_display_birthday: @user.is_display_birthday, name: @user.name, prefecture_id: @user.prefecture_id, profile_image_path: @user.profile_image_path, salt: @user.salt, status_id: @user.status_id, twitter_id: @user.twitter_id, user_code: @user.user_code, user_name: @user.user_name, website_url: @user.website_url, youtube_id: @user.youtube_id } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { area: @user.area, birthday: @user.birthday, crypted_password: @user.crypted_password, del_flg: @user.del_flg, email: @user.email, facebook_id: @user.facebook_id, github_id: @user.github_id, is_display_birthday: @user.is_display_birthday, name: @user.name, prefecture_id: @user.prefecture_id, profile_image_path: @user.profile_image_path, salt: @user.salt, status_id: @user.status_id, twitter_id: @user.twitter_id, user_code: @user.user_code, user_name: @user.user_name, website_url: @user.website_url, youtube_id: @user.youtube_id } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
