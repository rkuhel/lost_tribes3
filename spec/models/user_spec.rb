require 'spec_helper'
require "cancan/matchers"


describe User do
  subject(:user) {build(:user)}

  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  context 'all users' do
    it 'has a cart once created'
    it 'can have many carts'
    it 'has only one current cart'
  end

  context 'customer role' do
    it 'has the role of customer'
    it 'does not require street address'
    it 'does not require a city'
    it 'does not require a state'
    it 'does not require a phone number'
    it 'does not require a zip code'
    it 'cannot create an event'
    it 'cannot edit an event'
    it 'cannot delete an event'

  end

  context 'vendor role' do
    it 'has the role of vendor'
    it "Can't be created without required parameters" do
      user.role = 'vendor'
      user.save.should be_false
      user.street_address1 = '2333 norwood rd'
      user.save.should be_false
      user.city = 'Pompton Lakes'
      user.save.should be_false
      user.state = 'NY'
      user.save.should be_false
      user.phone = '555-555-5555'
      user.save.should be_false
      user.zip_code = '22222'
      user.save.should be_true
    end

    it 'can create an event'
    it 'can edit an event it created'
    it 'cannot edit an event it did not create'
    it 'can delete an event it created'
    it 'cannot delete an event it did not create'
  end

  context 'admin role' do
    it 'has the role of admin' do
      user.role = 'admin'
      user.role.should eq 'admin'
    end

    it 'can create an event'
    it 'can edit any event'
    it 'can delete any event'
    it 'can create a user'
    it 'can edit any user'
    it 'can delete any user'
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:events) }
    it 'has many carts'
  end
end

