require 'spec_helper'
require "cancan/matchers"


describe User do
  subject(:user) {build(:user)}

  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  context 'all users' do
    it 'has a cart once created' do 
      user.save
      user.carts.length.should eq 1
    end
    it 'can have many carts' do
      user.save
      user.carts.push(Cart.new)
      user.carts.length.should eq 2
    end
    # it 'has only one current cart'
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
  end

  context 'vendor role' do
    before do
      user.role = 'vendor'
    end
    it 'has the role of vendor' do
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
  end

  context 'admin role' do
    before do
      user.role = 'admin'
    end
    it 'has the role of admin' do
      user.save.should be_true
      user.role.should eq 'admin'
    end
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:events) }
    it { should have_many(:carts) }
  end
end








