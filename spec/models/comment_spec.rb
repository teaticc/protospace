require "rails_helper"

describe Comment do

  describe "validations" do

    describe "with valid attributes" do
      it "has a valid factory" do
        comment = build :comment
        expect(comment).to be_valid
      end

      it "is missing text" do
        comment = build :comment, comment: nil
        comment.valid?
        expect(comment.errors[:comment]).to include("can't be blank")
      end
    end

  end

  describe "associations" do

    describe "with valid associations" do
      it { should belong_to(:prototype) }
      it { should belong_to(:user) }
    end

  end

end
