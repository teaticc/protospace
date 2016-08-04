require 'rails_helper'

describe CommentsController do
  describe 'POST #create' do
    let(:prototype) {create :prototype, :with_main_image}

    context "when user signs in" do
      let(:user) { create :user }
      let(:request) { xhr :post, :create, prototype_id: prototype.id, comment: attributes_for(:comment) }

      before do
        sign_in user
      end

      after do
        sign_out user
      end

      it "creates a new comment" do
        expect{ request }.to change{ Comment.count }.by(1)
      end

      it "assigns a new comments list to @comments" do
        request
        expect(assigns(:comments)).to eq Comment.where(prototype_id: prototype.id)
      end

      it "renders comments with ajax" do
        request
        expect(response.code).to eq "200"
      end
    end

    context "when user signs out" do
      it "doesn't create a comment" do
      end

      it "redirects to root" do
      end
    end
  end
end
