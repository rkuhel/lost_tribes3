require 'spec_helper'

describe Event do
  
  describe 'validations' do
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:start_date)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:street)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:zip)}
  end

  describe 'associations' do
    it { should have_many(:line_items) }
  end

  describe 'self.to_csv' do
    xit "generates csv of event attribute"
  end
end