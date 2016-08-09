require "rails_helper"

feature "prototype" do
  let(:user) { create :user, :with_prototype }
  let(:prototype) { user.prototypes.first }
  before do
    login user
  end

  scenario "post" do
    visit root_path
    click_link "New Proto"
    fill_in "Title", with: "test proto"
    attach_file "prototype_captured_images_attributes_0_img_url", "spec/images/sample.png"
    attach_file "prototype_captured_images_attributes_1_img_url", "spec/images/avatar.jpg"
    fill_in "Catch Copy", with: "feature test"
    fill_in "Concept", with: "please pass"
    fill_in "Web Design", with: "test design"
    click_button "Publish"
    expect(page).to have_content "test proto"
    expect(page).to have_content "test design"
  end

  scenario "show" do
    visit root_path
    prototype_link = find("a[href='/prototypes/#{prototype.id}'] :first-child")
    prototype_link.click
    expect(find("#top-aligned-media").text).to eq prototype.title
    save_screenshot "prototype_show.png"
  end

  scenario "edit" do
    visit prototype_path(prototype)
    click_button "Edit"
    fill_in "Title", with: "New Title"
    click_button "Publish"
    expect(page).to have_content "New Title"
  end

  scenario "destroy" do
    visit prototype_path(prototype)
    click_button "Delete"
    expect(page).not_to have_content prototype.title
  end
end
