require "rails_helper"

feature "good" do
  let(:user) { create :user, :with_prototype }
  let(:prototype) { user.prototypes.first }
  let(:other_user) { create :other_user }
  before do
    login other_user
  end

  scenario "make good" do
    visit prototype_path(prototype)
    find("header button").click
    wait_for_css("#js-good_button") do |element|
      expect(element).to have_content "1"
    end
  end

  scenario "destroy good" do
    create :good, user_id: other_user.id, prototype_id: prototype.id
    visit prototype_path(prototype)
    find("header button").click
    wait_for_css("#js-good_button") do |element|
      expect(element).to have_content "0"
    end
  end
end
