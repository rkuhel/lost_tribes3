require 'spec_helper'

describe Beer do 
  describe 'associations' do 
    it { should have_many(:line_items) }
    it 'cannot be destroyed if reference by line item in current cart?'
  end
end