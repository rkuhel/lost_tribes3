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
    before do
      user.role = 'customer'
    end

    it 'has the role of customer' do
      user.save.should be_true
      user.role.should eq 'customer'
    end
    it 'can be created without the parameters required for a vendor' do
      user.save.should be_true
    end

    it 'cannot create an event'
    it 'cannot edit an event'
    it 'cannot delete an event'

  end

  context 'vendor role' do
    before do
      user.role = 'vendor'
    end
    it 'has the role of vendor' do
      # user.save.should be_true
      user.role.should eq 'vendor'
    end
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
      
    # it{should be_able_to(:manage, Event.new(:creator => user)) }

    it 'cannot edit an event it did not create'
    it 'can delete an event it created'
    it 'cannot delete an event it did not create'
  end

  context 'admin role' do
    before do
      user.role = 'admin'
    end
    it 'has the role of admin' do
      user.save.should be_true
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

  describe 'abilities' do
    ability = Ability.new(user)
    ability.should be_able_to(:manage, Event.new)


    # subject {ability}
    # let(:ability){ Ability.new(user) }
    # let(:user){ nil }

    # context 'when it is an admin' do
    #   let(:admin){ Factory(:admin) }

    #   it{ should be_able_to(:manage, Event.new) }
    # end
  end
end






    # describe 'vendor event management' do
    #   let(:event) { build(:event1) }
    #   it 'can create an event' do
    #     lambda {
    #       user.created_events << event
    #     }.should change{user.created_events.length}.from(0).to(1)
    #     event.creator.should eq user
    #   end
    #   it 'can edit an event it created' do

    #   end