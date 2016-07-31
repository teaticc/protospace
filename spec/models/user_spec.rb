require "rails_helper"

describe User do

  describe '#create' do

    # 登録内容必要十分
    describe "with valid attributes" do
      it "is valid with all information" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    describe "without valid attributes" do
      # いずれかの要素が空
      it "is invalid without a name" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "is invalid without an email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      # メルアド被り
      it "is invalid with duplicate email address " do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      # パスワード短い
      it "is invalid with a password shorter than 6 charactors " do
        user = build(:user,password: "12345")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
    end
  end

  describe "associations" do

    describe "with comments" do
      it "deletes the comments when user is deleted" do
        user = create :user, :with_comments
        comments = user.comments
        user.destroy
        expect(comments).to be_empty
      end
    end

    describe "with goods" do
      it "deletes the goods when user is deleted" do
        user = create :user, :with_goods
        goods = user.goods
        user.destroy
        expect(goods).to be_empty
      end
    end
  end
end
