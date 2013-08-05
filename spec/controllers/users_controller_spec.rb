require 'spec_helper'

describe UsersController do

  describe 'GET #index' do
    it 'assigns all users to an instance variable' do
      user = create(:user)
      user2 = create(:vendor)
      get :index
      assigns(:users).should eq [user, user2]
    end
  end

  it 'renders the :index view' do
    get :index
    response.should render_template :index
  end

  describe 'Get #new' do
    it 'assigns a new user to an instance variable' do
      get :new
      assigns(:user).should be_an_instance_of(User)
      assigns(:user).should be_new_record
    end
    it 'renders the :new view' do
      get :new
      response.should render_template :new
    end
  end

  describe 'Post #create' do
    context 'with valid attributes' do

      it 'creates a new user' do
        expect {
          post :create, user: attributes_for(:user)
        }.to change{User.count}.by(1)
      end

      it 'redirects to users show page' do
        post :create, user: attributes_for(:user)
        response.should redirect_to store_index_path
      end

      context 'with invalid attributes' do
        it 'does not create a new artist' do
          expect{
            post :create, user: attributes_for(:invalid_user)
          }.to change{User.count}.by(0)
        end
        it 're-renders the :new view' do
          post :create, user: attributes_for(:invalid_user)
          response.should render_template :new
        end
      end
    end
  end


  describe 'member' do
    let!(:user) {create(:user)}

    describe 'GET #edit' do
      before {get :edit, id: user}
      it 'assigns the given user to an instance variable' do
        assigns(:user).should eq user
      end
      it 'renders the :edit view' do
        response.should render_template :edit
      end
      describe 'GET #show' do
        before {get :show, id: user }
        it 'assigns the given user to an instance variable' do
          assigns(:user).should eq user
        end
        it 'renders the :show view' do
          response.should render_template :show
        end
      end


      describe 'PUT #update' do
        context 'with valid attributes' do
          it 'assigns the given user to an instance variable'
          it 'changes the attributes of the user'
          it 'redirects to the user page?'
        end

        context 'with invalid attributes' do
          it 'assigns the given user to an instance variable'
          it 'does not change the attributes of the user'
          it 're-renders the :edit page'
        end
      end
      

      describe 'DELETE #destroy' do
        it 'assigns the given user to an instance variable' do
          delete :destroy, id: user
          assigns(:user).should eq user
        end
        it 'deletes the user' do
          expect {
            delete :destroy, id: user
          }.to change {User.count}.by(-1)
        end
        it 'redirects to the user index page' do
        delete :destroy, id: user
        response.should redirect_to users_path 
      end
        context 'user deletes their account' do
          it 'redirects to the home page'
          context 'admin deletes a users account' do
            it 'redirects to the user index page?'
          end
        end
      end
    end
  end
end
