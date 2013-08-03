require 'spec_helper'

describe EventsController do

  describe 'GET #index' do
    it 'saves each event as an instance variable'
    it 'renders the :index view'
  end

  describe 'POST #create' do
    context 'when save succeeds' do
      it 'saves the event'
    end

    context 'when save fails'
  end

  describe 'GET #new' do
    it 'describes a new event as an instance variable'
    it 'renders the :new view'
  end

  describe 'GET #edit' do
    it 'assigns the given event to an instance variable'
    it 'renders the :edit view'
  end

  describe 'GET #show' do
    it 'assigns the given event to an isntance variable'
  end

  describe 'PUT #update' do
    context 'valid attributes' do
      it 'assigns the given event to an instance variable'
      it 'changes the attributes of the event'
      it 'goes to what page?'
    end
    context 'invalid attributes' do
      it 'assigns the given event to an instance variable'
      it 'does not change the attributes of the event?'
      it 'redirects back to the :edit page?'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the event'
  end
end
