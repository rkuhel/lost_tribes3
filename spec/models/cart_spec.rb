require 'spec_helper'

describe Cart do

  # subject(:cart) { Cart.create(user_id: 3, current: true) }

  describe 'associations' do
    it { should have_many(:line_items) }
    it 'must belong to a user' do
      cart = Cart.new(user_id: 1, current: true)
      expect(cart).to be_valid
    end
  end
end
