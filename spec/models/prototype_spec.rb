require "rails_helper"

describe Prototype do

  describe "validations" do

    describe "with valid attributes" do
      it "has a valid factory" do
        prototype = build :prototype, :with_main_image
        expect(prototype).to be_valid
      end
    end

    describe "without valid attributes" do

      it "is missing a title" do
        prototype = build :prototype, title: ""
        prototype.valid?
        expect(prototype.errors.messages[:title]).to include("can't be blank")
      end

      it "is missing a copy" do
        prototype = build :prototype, copy: ""
        prototype.valid?
        expect(prototype.errors.messages[:copy]).to include("can't be blank")
      end

      it "is missing a concept" do
        prototype = build :prototype, concept: ""
        prototype.valid?
        expect(prototype.errors.messages[:concept]).to include("can't be blank")
      end

      describe '#must_has_just_one_main_image' do

        context "when it has no image" do
          it "is missing a image" do
            prototype = build :prototype
            prototype.valid?
            expect(prototype.errors.messages[:captured_images]).to include("prototype needs just one main image")
          end
        end

        context "when it has two main images" do
          it "has too many images" do
            prototype = build :prototype, :with_two_main_images
            prototype.valid?
            expect(prototype.errors.messages[:captured_images]).to include("prototype needs just one main image")
          end
        end

      end

    end

  end

  describe "associations" do

    describe "with comments" do
      it "deletes the comments when prototype is deleted" do
        prototype = create :prototype, :with_comments, :with_main_image
        comments = prototype.comments
        prototype.destroy
        expect(comments).to be_empty
      end
    end

    describe "with goods" do
      it "deletes the goods when prototype is deleted" do
        prototype = create :prototype, :with_goods, :with_main_image
        goods = prototype.goods
        prototype.destroy
        expect(goods).to be_empty
      end
    end

    describe "with captured_images" do
      it "deletes the captured_images when prototype is deleted" do
        prototype = create :prototype, :with_full_images
        captured_images = prototype.captured_images
        prototype.destroy
        expect(captured_images).to be_empty
      end
    end

  end

  describe '#img_get(img_type)' do
    context "when img_type is main" do
      it "returns main image" do
        prototype = create :prototype, :with_full_images
        expect(prototype.img_get("main").img_type).to eq "main"
      end
    end

    context "when img_type is sub" do
      it "returns sub images" do
        prototype = create :prototype, :with_full_images
        prototype.img_get("sub").each do |sub_img|
          expect(sub_img.img_type).to eq "sub"
        end
      end
    end

  end

  describe "sub_img_with_blank" do
    context "when prototype has 3 sub images" do
      it "returns those images" do
        prototype = create :prototype, :with_full_images
        sub_images = prototype.captured_images.sub
        expect(prototype.sub_img_with_blank).to eq sub_images
      end
    end

    context "when prototype has no sub image" do
      it "returns 3 blank instance" do
        prototype = create :prototype, :with_main_image
        blank_sub = []
        3.times do
          blank_sub << prototype.captured_images.new(img_type: 1)
        end
        expect(prototype.sub_img_with_blank).to eq blank_sub
      end
    end
  end

end
