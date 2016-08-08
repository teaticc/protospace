require 'rails_helper'

describe PrototypesController do
  let(:user){ create :user, :with_prototype}
  let(:prototype){ user.prototypes.first }

  describe 'GET #index' do
    let(:request) { get :index }

    it 'asiigns the requested prototypes to @prototypes' do
      prototypes = create_list :prototype, 4, :with_main_image
      request
      expect(assigns(:prototypes)).to eq prototypes.sort{ |a,b| b.id <=> a.id}
    end

    it "renders the index template" do
      request
      expect(response).to render_template :index
    end
  end

  describe 'GET #SHOW' do
    let(:prototype) { create :prototype, :with_main_image }
    before do
      get :show, id: prototype
    end

    it 'assigns the requested prototype to @prototype' do
      expect(assigns(:prototype)).to eq prototype
    end

    it { expect(response).to render_template :show }
  end

  context "when user logs in" do
    let(:other_prototype){ build :other_prototype, :with_main_image }
    let(:other_user){ create :other_user, :with_other_prototype }

    before do
      sign_in user
    end

    after do
      sign_out user
    end

    describe 'GET #new' do
      before do
        get :new
      end

      it "assigns a blank instance to @prototype" do
        expect(assigns(:prototype)).to be_a_new Prototype
      end

      it "assigns a blank instanace to @prototype.captured_images" do
        expect(assigns(:prototype).captured_images.first).to be_a_new CapturedImage
      end

      it { expect(response).to render_template :new }
    end

    describe 'POST #create' do
      let(:request){ post :create, prototype: attributes_for(:other_prototype, captured_images_attributes: { "0": attributes_for(:captured_image) }) }

      context "with valid input" do
        it "assigns an inputed prototype to @prototype" do
          request
          expect(assigns(:prototype)).to be_persisted
        end

        it "saves a new prototype" do
          expect{ request }.to change{ Prototype.count }.by(1)
        end

        it "flash a message" do
          request
          expect(flash[:notice]).to eq "successfully posted"
        end

        it "redirects to root" do
          request
          expect(response).to redirect_to :root
        end
      end

      context "with invalid input" do
        let(:request){ post :create, prototype: attributes_for(:other_prototype, title: "") }

        it "doesn't create a prototype" do
          request
          expect(assigns(:prototype)).not_to be_persisted
        end

        it "renders :new template" do
          request
          expect(response).to render_template :new
        end
      end
    end

    describe 'GET #edit' do
      context "trying to edit its own prototype" do
        before do
          get :edit, id: prototype
        end

        it "assigns the requested prototype to @prototype" do
          expect(assigns(:prototype)).to eq prototype
        end

        it "assigns the requested captured images with blank instance to @sub_img" do
          assigns(:sub_img).each_with_index do |sub_img, i|
            expect(sub_img.attributes).to include prototype.sub_img_with_blank[i].attributes
          end
        end

        it { expect(response).to render_template :edit}
      end

      context "trying to edit other user's prototype" do
        it "redirects to root" do
          get :edit, id: other_user.prototypes.first
          expect(response).to redirect_to :root
        end
      end
    end

    describe 'PATCH #update' do
      let(:request){ patch :update, id: prototype, prototype: attributes_for(:other_prototype) }

      it "assigns the requested prototype to @prototype " do
        request
        expect(assigns(:prototype)).to eq prototype
      end

      context 'when successfully updated' do
        before do
          request
        end

        it "updates prototype" do
          expect(assigns(:prototype).attributes.symbolize_keys).to include attributes_for(:other_prototype)
        end

        it "flash a message" do
          expect(flash[:notice]).to eq "successfully updated"
        end

        it { expect(response).to redirect_to :root }
      end

      context "when failed to update" do
        let(:bad_request){ patch :update, id: prototype, prototype: attributes_for(:prototype, title: nil) }

        it "doesn't change prototype" do
          expect{ bad_request }.not_to change{ Prototype.find(prototype.id).attributes }
        end

        it "renders edit template" do
          bad_request
          expect(response).to render_template :edit, id: prototype
        end
      end

      context "when trying to update other user's prototype" do
        let(:others_request){ patch :update, id: other_user.prototypes.first, prototype: attributes_for(:prototype) }

        it "doesn't change the prototype" do
          expect{ others_request }.not_to change{ Prototype.find(other_user.prototypes.first.id).attributes }
        end

        it "redirects to root" do
          others_request
          expect(response).to redirect_to :root
        end
      end
    end

    describe 'DELETE #destroy' do
      let :request do
        delete :destroy, id: prototype
      end

      it "assigns the requested prototype to @prototype " do
        request
        expect(assigns(:prototype)).to eq prototype
      end

      it "deletes prototype" do
        old_id = prototype.id
        request
        expect{ Prototype.find(old_id) }.to raise_error ActiveRecord::RecordNotFound
      end

      it "flash a message" do
        request
        expect(flash[:notice]).to eq "successfully deleted"
      end

      it "redirect to index" do
        request
        expect(response).to redirect_to :root
      end

      context "trying to delete other user's prototype" do
        let :others_request do
          delete :destroy, id: other_user.prototypes.first
        end

        it "doesn't delete the prototype" do
          others_request
          expect(assigns(:prototype)).to be_persisted
        end

        it "redirects to root" do
          others_request
          expect(response).to redirect_to :root
        end
      end
    end
  end

  context "when user logs out" do
    it "redirects to root" do
      post :create, prototype: attributes_for(:prototype)
      expect(response).to redirect_to :root
    end

    it "redirects to root" do
      get :new
      expect(response).to redirect_to :root
    end

    it "redirects to root" do
      get :edit, id: prototype.id
      expect(response).to redirect_to :root
    end

    it "redirects to root" do
      patch :update, id: prototype.id, prototype: attributes_for(:other_prototype)
      expect(response).to redirect_to :root
    end

    it "redirects to root" do
      delete :destroy, id: prototype.id
      expect(response).to redirect_to :root
    end
  end
end
