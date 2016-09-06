require 'rails_helper'

describe UsersController do
  describe 'with user login' do
    login_user

    let(:user){ create(:user) }
    context 'GET #show' do
      before do
        get :show, id: user
      end

      it "assigns he requested user to @user" do
        expect(assigns(:user)).to match(user)
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end

    context 'GET #edit' do
      before do
        get :edit, id: user
      end

      it "assigns he requested user to @user" do
        expect(assigns(:user)).to match(user)
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    context 'PATCH #update' do
      let(:params){{
        id: user.id,
            user: attributes_for(:user, name: 'test')
      }}

      before do
        patch :update, params
      end

      it "assigns he requested user to @user" do
        expect(assigns(:user)).to match(user)
      end

      it "changes @user's attributes" do
        user.reload
        expect(user.name).to eq 'test'
      end

      it "redirects to root_path" do
        expect(response).to redirect_to user_path
      end

      it "sends flash a message" do
        expect(flash[:success]).to eq 'Your data was successfully updated'
      end
    end
  end

  describe 'without user login' do
    let(:user){ create(:user) }
    context 'GET #edit' do
      it "redirects to sign_in page" do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'PATCH #update' do
      let(:params){{
        id: user.id,
        user: attributes_for(:user)
      }}
      it "redirects to sign_in page" do
        patch :update, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
