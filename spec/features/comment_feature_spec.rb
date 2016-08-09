require "rails_helper"

feature "comment" do
  let(:user) { create :user, :with_prototype }
  let(:prototype) { user.prototypes.first }
  let(:other_user) { create :other_user }
  before do
    login other_user
  end

  scenario "comment" do
    visit prototype_path(prototype)
    fill_in "comment_comment", with: "test comment"
    click_button "Comment"
    expect(page).to have_content "test comment"
    expect(find("#js-comments_count").text).to eq "(1)"
  end
end
