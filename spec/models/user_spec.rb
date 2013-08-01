require 'spec_helper'
require "cancan/matchers"


describe User do
  subject(:user) {build(:user)}

  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'vendor role' do
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

  describe 'admin role' do
    it 'can be properly created' do
      user.role = 'admin'
      user.role.should eq 'admin'
    end
  end
end

#    describe 'associations' do
#      it { should have_and_belong_to_many(:events) }
#    end
#  end

