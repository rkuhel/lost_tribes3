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

#  context "Users" do
#    it "users do not require street address" do
#      subject.street_address = nil
#      expect(subject).to be_valid
#    end
#    it "users do not require city" do
#      subject.city = nil
#      expect(subject).to be_valid
#    end
#    it "users do not require a state" do
#      subject.state = nil
#      expect(subject).to be_valid
#    end
#    it "users do not require phone number" do
#      subject.phone_number = nil
#      expect(subject).to be_valid
#    end
#    it "users should require a zip" do
#      subject.zip = nil
#      expect(subject).to be_invalid
#    end
#  end


#    describe 'associations' do
#      it { should have_and_belong_to_many(:events) }
#    end
#  end

