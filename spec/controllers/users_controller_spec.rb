require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    context 'with user login' do
      login_user

      subject(:user){ create(:user) }

      before do
        get :show, id: subject
      end

      it "assigns he requested user to @user" do
        expect(assigns(:user)).to eq subject
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
  end

  describe 'GET #edit' do
    context 'with user login' do
      login_user

      subject(:user){ create(:user) }
      before do
        get :edit, id: subject
      end

      it "assigns he requested user to @user" do
        expect(assigns(:user)).to eq subject
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    context 'without user login' do
      subject(:user){ create(:user) }

      it "redirects to sign_in page" do
        get :edit, id: subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH #update' do
    context 'with user login' do
      login_user

      subject(:user){ create(:user) }
      let(:params){{
          id: subject.id,
          user: attributes_for(:user, name: 'test')
      }}

      before do
        patch :update, params
      end

      it "assigns he requested user to @user" do
        expect(assigns(:user)).to eq subject
      end

      it "changes @user's attributes" do
        user.reload
        expect(subject.name).to eq 'test'
      end

      it "redirects to root_path" do
        expect(response).to redirect_to user_path
      end

      it "sends flash a message" do
        expect(flash[:success]).to eq 'Your data was successfully updated'
      end
    end

    context 'without user login' do
      subject(:user){ create(:user) }
      let(:params){{
          id: subject.id,
          user: attributes_for(:user)
      }}
      it "redirects to sign_in page" do
        patch :update, params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
