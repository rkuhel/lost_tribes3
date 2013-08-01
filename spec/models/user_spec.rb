require 'spec_helper'
require "cancan/matchers"


describe User do
  subject(:user) {build(:user)}
  subject(:vendor) {build(:vendor)}

  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'vendor role' do
    it "Can't be created without a street address" do
      user.role = 'vendor'
      user.save.should be_false
      user.street_address1 = '2333 norwood rd'
      user.save.should be_true
    end

    it "Can't be created without a city" do 
      # vendor.city = nil
      # vendor.save.should be_false
    end
  end

  describe 'admin role' do
    it 'can be properly created' do
      user.role = 'admin'
      user.role.should eq 'admin'
    end
  end

  #    it "vendors should have city" do
  #      vendor = create(:vendor)
  #      vendor.city = nil
  #      expect(vendor).to be_invalid
  #    end
  #    it "vendors should have a state" do
  #      vendor = create(:vendor)
  #      vendor.state = nil
  #      expect(vendor).to be_invalid
  #    end
  #    it "vendors must have a phone number" do
  #      vendor = create(:vendor)
  #      vendor.phone_number = nil
  #      expect(vendor).to be_invalid
  #    end
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

