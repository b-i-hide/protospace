require 'rails_helper'

describe PrototypesController do
  let(:params) {{
      id: subject.id,
      prototype: attributes_for(:prototype, name: 'hoge')
  }}
  let(:invalid_params) {{
      id: subject.id,
      prototype: attributes_for(:prototype, name: nil)
  }}

  describe 'GET #index' do
    before do
      get :index
    end

    it "assigns the requested prototypes to @prototypes" do
      prototypes = create_list(:prototype, 5)
      expect(assigns(:prototypes)).to match(prototypes)
    end

    it "renders the :new template" do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    context 'with user login' do
      login_user

      subject(:prototype){ build(:prototype) }

      before do
        get :new
      end
      it "renders the :new template" do
        expect(response).to render_template :new
      end

      it "assigns the requested prototypes to @prototypes" do
        expect(subject).to be_a_new(Prototype)
      end
    end

    context 'without user login' do
      it "redirects sign_in page" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'with user login' do
      login_user
      context 'with valid attributes' do
        subject{
          Proc.new { post :create, prototype: attributes_for(:prototype) }
        }

        before do
          subject.call
        end

        it "saves the new prototype in the database" do
          expect{
            subject.call
          }.to change(Prototype, :count).by(1)
        end

        it "redirects to root_path" do
          expect(response).to redirect_to(root_path)
        end

        it "shows flash messages to show save the prototype successfully" do
          expect(flash[:success]).to eq 'Your prototype was successfully posted'
        end
      end

      context 'with invalid attributes' do
        subject{
          Proc.new { post :create, prototype: attributes_for(:prototype, name: nil) }
        }

        before do
          subject.call
        end

        it "does not save the new project in the database" do
          expect{
            subject.call
          }.not_to change(Prototype, :count)
        end

        it "redirects to new_prototype_path" do
          expect(response).to render_template :new
        end

        it "shows flash messages to show save the prototype unsuccessfully" do
          expect(flash[:alert]).to eq 'Failed'
        end
      end
    end

    context 'without user login' do
      it "redirects sign_in page" do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #show' do
    context 'with user login' do
      login_user
      subject(:prototype){ create(:prototype) }
      let(:like){ create(:like) }

      before do
        get :show, id: subject
      end

      it "assigns the requested prototype to @prototype" do
        expect(assigns(:prototype)).to eq subject
      end

      it "assigns the requested comment to @comment" do
        expect(assigns(:comment)).to be_a(Comment)
      end

      it "assigns like associated with prototype to @like" do
        user = subject.user
        expect(assigns(:like)).to eq subject.likes.find_by(user_id: user.id, prototype_id: subject.id)
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
  end

  describe 'GET #edit' do
    subject(:prototype){ create(:prototype) }
    context 'with user login' do
      login_user

      before do
        get :edit, id: subject
      end

      it "assigns the requested prototype to @prototype" do
        expect(assigns(:prototype)).to eq subject
      end

      it "assigns main_image to @main_image" do
        expect(assigns(:main_image)).to eq subject.main_image
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    context 'without user login' do
      it "redirects sign_in page" do
        get :edit, id: subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH #update' do
    context 'with user login' do
      login_user
      subject(:prototype){ create(:prototype) }

      context 'with valid attributes' do
        before do
          patch :update, params
        end

        it "assigns the requested prototype to @prototype" do
          expect(assigns(:prototype)).to eq subject
        end

        it "updates attributes of prototype" do
          subject.reload
          expect(subject.name).to eq 'hoge'
        end

        it "redirects to prototype_path" do
          expect(response).to redirect_to prototype_path
        end

        it "shows flash message to show update prototype successfully" do
          expect(flash[:success]).to eq 'Your prototype was successfully updated'
        end
      end

      context 'with invalid attributes' do
        before do
          patch :update, invalid_params
        end

        it "assigns the requested prototype to @prototype" do
          expect(assigns(:prototype)).to eq subject
        end

        it "does not save with invalid attributes" do
          subject.reload
          expect(subject.name).to eq 'test'
        end

        it "renders the :edit template" do
          expect(response).to render_template :edit
        end

        it "shows flash message to show update prototype unsuccessfully" do
          expect(flash[:alert]).to eq 'Your prototype was not updated'
        end
      end
    end

    context 'without user login' do
      subject(:prototype){ create(:prototype) }

      it "redirects sign_in page" do
        patch :update, params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'DELETE #destroy' do
    subject!(:prototype){ create(:prototype) }
    context 'with user login' do
      login_user

      it "assigns the requested prototype to @prototype" do
        delete :destroy, id: subject
        expect(assigns(:prototype)).to eq subject
      end

      it "deletes the prototype" do
        expect{
          delete :destroy, id: subject
        }.to change(Prototype, :count).by(-1)
      end

      it "redirects to root_path" do
        delete :destroy, id: subject
        expect(response).to redirect_to root_path
      end

      it "shows flash message to show update prototype successfully" do
        delete :destroy, id: subject
        expect(flash[:success]).to eq 'Your prototype was successfully deleted'
      end
    end

    context 'without user login' do
      it "redirects sign_in page" do
        delete :destroy, id: subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
