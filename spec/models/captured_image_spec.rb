require "rails_helper"

describe CapturedImage do

  describe "validations" do

    context "with valid attributes" do
      it "has a valid factory" do
        captured_image = build :captured_image
        expect(captured_image).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid file" do
        captured_image = build :captured_image, :with_txt_file
        captured_image.valid?
        expect(captured_image.errors[:img_url]).to include("You are not allowed to upload \"txt\" files, allowed types: jpg, jpeg, gif, png")
      end
    end

  end

end
