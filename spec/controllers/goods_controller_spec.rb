require 'rails_helper'

describe GoodsController do
  let(:user) { create :user }
  let(:prototype) { create :prototype, :with_main_image }
  before do
    sign_in user
  end

  after do
    sign_out user
  end

  describe 'POST #create' do
    let(:request) { xhr :post, :create, prototype_id: prototype.id }
    it "assigns requested prototype to @prototype" do
      request
      expect(assigns(:prototype)).to eq prototype
    end

    it "creates a new good record" do
      expect{ request }.to change{ Good.count }.by(1)
    end

    it "renders the good block with ajax" do
      request
      expect(response.code).to eq "200"
    end

    it "renders :create template (it is a js file)" do
      request
      expect(response).to render_template :create
    end
  end

  describe 'DELETE #destroy' do
    let(:good) { create :good, prototype_id: prototype.id, user_id: user.id }
    let(:request) { xhr :delete, :destroy, prototype_id: prototype.id, id: good.id }

    it "assigns requested prototype to @prototype" do
      request
      expect(assigns(:prototype)).to eq prototype
    end

    it "deletes the good record" do
      old_id = good.id
      request
      expect{ Good.find(old_id) }.to raise_error ActiveRecord::RecordNotFound
    end

    it "renders the good block with ajax" do
      request
      expect(response.code).to eq "200"
    end

    it "renders :destroy template (it is a js file)" do
      request
      expect(response).to render_template :destroy
    end
  end

end
