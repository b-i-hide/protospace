require 'rails_helper'

describe PrototypesController do
  describe 'with user login' do
    login_user
    describe 'GET #index' do
      it "assigns the requested prototypes to @prototypes" do
        prototypes = create_list(:prototype, 5)
        get :index
        expect(assigns(:prototypes)).to match(prototypes)
      end

      it "renders the :new template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        subject{
          Proc.new { post :create, prototype: attributes_for(:prototype) }
        }
        it "saves the new prototype in the database" do
          expect{
            subject.call
          }.to change(Prototype, :count).by(1)
        end

        it "redirects to root_path" do
          subject.call
          expect(response).to redirect_to(root_path)
        end

        it "shows flash messages to show save the prototype successfully" do
          subject.call
          expect(flash[:success]).to eq 'Your prototype was successfully posted'
        end
      end

      context 'with invalid attributes' do
        subject{
          Proc.new { post :create, prototype: attributes_for(:prototype, name: nil) }
        }
        it "does not save the new project in the database" do
          expect{
            subject.call
          }.not_to change(Prototype, :count)
        end

        it "redirects to new_prototype_path" do
          subject.call
          expect(response).to render_template :new
        end

        it "shows flash messages to show save the prototype unsuccessfully" do
          subject.call
          expect(flash[:alert]).to eq 'Failed'
        end
      end
    end

    describe 'GET #show' do
      let(:prototype){ create(:prototype) }
      let(:like){ create(:like) }

      before do
        get :show, id: prototype
      end
      it "assigns the requested prototype to @prototype" do
        expect(assigns(:prototype)).to match(prototype)
      end

      it "assigns the requested comment to @comment" do
        expect(assigns(:comment)).to be_a(Comment)
      end

      it "assigns like associated with prototype to @like" do
        user = prototype.user
        expect(assigns(:like)).to eq prototype.likes.find_by(user_id: user.id, prototype_id: prototype.id)
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      let(:prototype){ create(:prototype) }

      before do
        get :edit, id: prototype
      end

      it "assigns the requested prototype to @prototype" do
        expect(assigns(:prototype)).to match(prototype)
      end

      it "assigns main_image to @main_image" do
        expect(assigns(:main_image)).to eq(prototype.main_image)
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      let(:prototype){ create(:prototype) }
      let(:params) {{
          id: prototype.id,
          prototype: attributes_for(:prototype, name: 'hoge')
      }}
      let(:invalid_params) {{
          id: prototype.id,
          prototype: attributes_for(:prototype, name: nil)
      }}

      context 'with valid attributes' do
        before do
          patch :update, params
        end

        it "assigns the requested prototype to @prototype" do
          expect(assigns(:prototype)).to match(prototype)
        end

        it "updates attributes of prototype" do
          prototype.reload
          expect(prototype.name).to eq 'hoge'
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
          expect(assigns(:prototype)).to match(prototype)
        end

        it "does not save with invalid attributes" do
          prototype.reload
          expect(prototype.name).to eq 'test'
        end

        it "renders the :edit template" do
          expect(response).to render_template :edit
        end

        it "shows flash message to show update prototype unsuccessfully" do
          expect(flash[:alert]).to eq 'Your prototype was not updated'
        end
      end
    end

    describe 'DELETE #destroy' do
      let!(:prototype){ create(:prototype) }

      it "assigns the requested prototype to @prototype" do
        delete :destroy, id: prototype
        expect(assigns(:prototype)).to match(prototype)
      end

      it "deletes the prototype" do
        expect{
          delete :destroy, id: prototype
        }.to change(Prototype, :count).by(-1)
      end

      it "redirects to root_path" do
        delete :destroy, id: prototype
        expect(response).to redirect_to root_path
      end

      it "shows flash message to show update prototype successfully" do
        delete :destroy, id: prototype
        expect(flash[:success]).to eq 'Your prototype was successfully deleted'
      end
    end
  end

  describe 'without user login' do
    let(:prototype){ create(:prototype) }
    let(:params) {{
        id: prototype.id,
        prototype: attributes_for(:prototype, name: 'hoge')
    }}

    describe "GET #new" do
      it "redirects sign_in page" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST #create" do
      it "redirects sign_in page" do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET #edit" do
      it "redirects sign_in page" do
        get :edit, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "PATCH #update" do
      it "redirects sign_in page" do
        patch :update, params
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE #destroy" do
      it "redirects sign_in page" do
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
