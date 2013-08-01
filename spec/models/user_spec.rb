require 'spec_helper'
require "cancan/matchers"


describe User do
 subject(:user) {build(:user)}
 describe 'vendor user' do
  it 'can manage something' do
    user.role = 'vendor'
    p user
    user.save.should be_false
  end
 end

 describe 'admin user' do
  it 'can manage something' do
    user.role = 'admin'
    p user
    user.save.should be_true
  end
 end


  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  context "Admins" do 
    it "has the role admin" do
      admin = create(:admin)
      admin.role.should eq 'admin'
    end
  end

  context "Vendors" do 
    it "requires vendors to have street address" do
      vendor = create(:vendor)
      expect(vendor).to be_valid
      vendor.street_address1 = nil 
      expect(vendor).to be_invalid
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
end


