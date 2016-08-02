require "rails_helper"

describe UsersController do

  describe 'GET #show' do
    let :user do
      create :user
    end

    it "assigns the requested user to @user " do
      get :show, id: user
      expect(assigns(:user)).to match user
    end

    it "renders the :show template" do
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  context "when user log in" do
    before do
      @user = create(:user)
      sign_in @user
    end

    after do
      sign_out @user
    end

    context "when user edits own user infomation" do
      describe 'GET #edit' do
        it "assigns the requested user to @user " do
          get :edit, id: @user
          expect(assigns(:user)).to match @user
        end

        it "renders the :edit template" do
          get :edit, id: @user
          expect(response).to render_template :edit
        end
      end

      describe 'PATCH #update' do

        it "assigns the requested user to @user " do
          patch :update, id: @user, user: attributes_for(:user)
          expect(assigns(:user)).to match @user
        end

        context 'when successfully updated' do
          it "updates user" do
            patch :update, id: @user, user: attributes_for(:user, email: "new@address")
            @user.reload
            expect(@user.email).to eq "new@address"
          end

          it "redirect to index" do
            patch :update, id: @user, user: attributes_for(:user)
            expect(response).to redirect_to :root
          end
        end

        context "when failed to update" do
          it "doesn't change user" do
            old_name = @user.name
            patch :update, id: @user, user: attributes_for(:user, name: nil)
            @user.reload
            expect(@user.name).to eq old_name
          end

          it "redirect to edit" do
            patch :update, id: @user, user: attributes_for(:user, name: nil)
            expect(response).to render_template :edit
          end
        end
      end
    end

    context "when user try to edit other user's information " do
      let :other_user do
        create :other_user
      end

      it "redirect to root" do
        get :edit, id: other_user
        expect(response).to redirect_to :root
      end

      it "redirect to root" do
        get :update, id: other_user
        expect(response).to redirect_to :root
      end
    end

  end

  context "when user log out" do

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
