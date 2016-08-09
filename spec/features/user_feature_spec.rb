require "rails_helper"

feature "user function" do
  let(:user) { create :user }

  scenario "sign up" do
    visit root_path
    click_link "Get Started"
    click_link "Sign up now"
    fill_in "user_name", with: "テストくん"
    fill_in "user_email", with: "test@mail.com"
    fill_in "user_password", with: "testtest"
    fill_in "user_member", with: "tester"
    fill_in "user_profile", with: "born to test"
    fill_in "user_works", with: "test and test"
    attach_file "user_avatar", "#{::Rails.root}/spec/images/avatar.jpg"
    click_button "save"
    expect(page).to have_content "テストくん"
    page.save_screenshot "sign_up.png"
  end

  scenario "sign in" do
    visit new_user_session_path
    fill_in "inputEmail", with: user.email
    fill_in "inputPassword", with: 123456
    click_button "Sign in"
    expect(page).to have_content user.name
  end

  scenario "sign out" do
    login user
    visit root_path
    click_link user.name
    click_link "Logout"
    expect(page).not_to have_content user.name
  end

  scenario "edit profile" do
    login user
    visit root_path
    click_link user.name
    click_link "Profile Edit"
    fill_in "user_password", with: "123456"
    fill_in "user_name", with: "New Name"
    click_button "save"
    page.save_screenshot "edit_profile.png"
    expect(page).to have_content "New Name"
  end

end
