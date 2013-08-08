require 'spec_helper'

describe Beer do 
  describe 'associations' do 
    it { should have_many(:line_items) }
  end
end