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
    it 'render the :new view' do
      get :new
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user'
      it 'redirects to what page?'
    end

    context 'with invalid attributes' do
      it 'does not create a new artist'
      it 're-renders the :new view'
    end
  end

  describe 'GET #edit' do
    it 'assigns the given user to an instance variable'
    it 'renders the :edit view?'
  end

  describe 'GET #show' do
    it 'assigns the given user to an instance variable'
    it 'renders the show view?'
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
    it 'assigns the given user to an instance variable'
    it 'deletes the user'
    context 'user deletes their account' do
      it 'redirects to the home page'
      context 'admin deletes a users account' do
        it 'redirects to the user index page?'
      end
    end
  end
end