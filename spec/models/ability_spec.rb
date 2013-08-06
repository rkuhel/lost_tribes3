require 'spec_helper'
require 'cancan/matchers'

describe Ability do 


  context "admin" do
    let(:admin){ build(:admin) }
    before do
      @ability = Ability.new(admin)
    end
    it 'should be able to manage beer' do
      @ability.should be_able_to(:manage, Beer.new)
    end
    it 'should be able to manage events' do
      @ability.should be_able_to(:manage, Event.new)
    end
    it 'should be able to manage users' do
      @ability.should be_able_to(:manage, User.new)
    end
    it 'should be able to manage carts' do
      @ability.should be_able_to(:manage, Cart.new)
    end
  end

  context "vendor" do
    let(:vendor){ build(:vendor) }
    before do
      @ability = Ability.new(vendor)
    end
    it 'should be able to read beer' do
      @ability.should be_able_to(:read, Beer.new)
    end
    it 'should be able to read events' do
      @ability.should be_able_to(:read, Event.new)
    end
    it 'should be able to create events' do
      @ability.should be_able_to(:create, Event.new)
    end
    it 'should be able to edit itself' do
      @ability.should be_able_to(:update, vendor)
    end
    it 'should not be able to edit others' do
      schmuck = User.create(name: 'joe', password: 'password', email: 'joe@email.com')
      @ability.should_not be_able_to(:update, schmuck)
    end
    it 'should be able to destroy its profile' do
      @ability.should be_able_to(:destroy, vendor)
    end
    it 'should not be able to delete other users' do 
      schmuck = User.create(name: 'joe', password: 'password', email: 'joe@email.com')
      @ability.should_not be_able_to(:destroy, schmuck)
    end
  end

  context 'customer' do 
    let(:customer){ build(:customer) }
    before do
      @ability = Ability.new(customer)
    end

    it 'should be able to read beer' do
      @ability.should be_able_to(:read, Beer.new)
    end
    it 'should not be able to create beer' do
      @ability.should_not be_able_to(:create, Beer.new)
    end
    it 'should not be able to edit beer' do
      @ability.should_not be_able_to(:update, Beer.new)
    end
    it 'should be able to read events' do
      @ability.should be_able_to(:read, Event.new)
    end
    it 'should not be able to create events' do
      @ability.should_not be_able_to(:create, Event.new)
    end
    it 'should not be able to edit events' do
      @ability.should_not be_able_to(:update, Event.new)
    end
    # it 'should be able to view its own cart'
    # it "should not be able to view someone else's cart"
    # it 'should not be able to view the users page'
    # it 'should be able to see its show page'
  end

  context 'guest' do
    let(:user){ build(:user) }
    # let(:ability){ Ability.new(user) }
    before do
      @ability = Ability.new(user)
    end
    # it { should be_able_to(:read, Beer.new) }
    it 'should be able to read beer' do
      @ability.should be_able_to(:read, Beer.new)
    end
    it 'should be able to read events' do
      @ability.should be_able_to(:read, Event.new)
    end
  end
end