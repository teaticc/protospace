require "rails_helper"

describe UsersController do
  let(:user) { create :user }

  describe 'GET #show' do
    let(:request) { get :show, id: user }
    it "assigns the requested user to @user " do
      request
      expect(assigns(:user)).to eq user
    end

    it "renders the :show template" do
      request
      expect(response).to render_template :show
    end
  end

  context "when user logs in" do
    let(:other_user) { create :other_user }

    before do
      sign_in user
    end

    after do
      sign_out user
    end

    describe 'GET #edit' do
      it "assigns the requested user to @user " do
        get :edit, id: user
        expect(assigns(:user)).to eq user
      end

      context "when user edits own user infomation" do
        it "renders the :edit template" do
          get :edit, id: user
          expect(response).to render_template :edit
        end
      end

      context "when user try to edit other user's information " do
        it "redirect to root" do
          get :edit, id: other_user
          expect(response).to redirect_to :root
        end
      end
    end

    describe 'PATCH #update' do
      let(:request) { patch :update, id: user, user: attributes_for(:other_user) }

      it "assigns the requested user to @user " do
        request
        expect(assigns(:user)).to eq user
        end

      context "when user edits own user infomation" do
        context 'when successfully updated' do
          it "updates user" do
            expect{ request }.to change{ User.find(user.id).attributes }
          end

          it "flash a message" do
            request
            expect(flash[:notice]).to eq "successfully updated!"
          end

          it "redirect to index" do
            request
            expect(response).to redirect_to :root
          end
        end

        context "when failed to update" do
          let(:bad_request) { patch :update, id: user, user: attributes_for(:other_user, name: nil) }

          it "doesn't change the user" do
            expect{ bad_request }.not_to change{ User.find(user.id).attributes }
          end

          it "redirects to edit" do
            bad_request
            expect(response).to render_template :edit
          end
        end
      end

      context "when user try to edit other user's information " do
        let(:others_request) {patch :update, id: other_user, user: attributes_for(:user)}

        it "doesn't change the user" do
          expect{ others_request }.not_to change{ User.find(other_user.id).attributes }
        end

        it "redirects to root" do
          others_request
          expect(response).to redirect_to :root
        end
      end
    end


  end

  context "when user logs out" do

    it "redirect to root" do
      get :edit, id: rand(100)
      expect(response).to redirect_to :root
    end

    it "redirect to root" do
      get :update, id: rand(100)
      expect(response).to redirect_to :root
    end

  end
end
