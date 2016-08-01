require "rails_helper"

describe CapturedImage do

  describe "validations" do

    describe "with valid attributes" do
      it "has a valid factory" do
        captured_image = build :captured_image
        expect(captured_image).to be_valid
      end

      it "is missing img_url" do
        captured_image = build :captured_image, img_url: nil
        captured_image.valid?
        expect(captured_image.errors[:img_url]).to include("can't be blank")
      end
    end

  end

end
