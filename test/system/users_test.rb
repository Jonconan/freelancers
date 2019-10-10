require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Area", with: @user.area
    fill_in "Birthday", with: @user.birthday
    fill_in "Crypted password", with: @user.crypted_password
    check "Del flg" if @user.del_flg
    fill_in "Email", with: @user.email
    fill_in "Facebook", with: @user.facebook_id
    fill_in "Github", with: @user.github_id
    check "Is display birthday" if @user.is_display_birthday
    fill_in "Name", with: @user.name
    fill_in "Prefecture", with: @user.prefecture_id
    fill_in "Profile image path", with: @user.profile_image_path
    fill_in "Salt", with: @user.salt
    fill_in "Status", with: @user.status_id
    fill_in "Twitter", with: @user.twitter_id
    fill_in "User code", with: @user.user_code
    fill_in "User name", with: @user.user_name
    fill_in "Website url", with: @user.website_url
    fill_in "Youtube", with: @user.youtube_id
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Area", with: @user.area
    fill_in "Birthday", with: @user.birthday
    fill_in "Crypted password", with: @user.crypted_password
    check "Del flg" if @user.del_flg
    fill_in "Email", with: @user.email
    fill_in "Facebook", with: @user.facebook_id
    fill_in "Github", with: @user.github_id
    check "Is display birthday" if @user.is_display_birthday
    fill_in "Name", with: @user.name
    fill_in "Prefecture", with: @user.prefecture_id
    fill_in "Profile image path", with: @user.profile_image_path
    fill_in "Salt", with: @user.salt
    fill_in "Status", with: @user.status_id
    fill_in "Twitter", with: @user.twitter_id
    fill_in "User code", with: @user.user_code
    fill_in "User name", with: @user.user_name
    fill_in "Website url", with: @user.website_url
    fill_in "Youtube", with: @user.youtube_id
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
