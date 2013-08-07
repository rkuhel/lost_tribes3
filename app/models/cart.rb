class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  # before_destroy :ensure_not_referenced_by_any_line_item
  belongs_to :user
  attr_accessible :current


  def total_up_cart
    total = 0
    cart_total = []
    self.line_items.each do |li|
      li.beer_id
      beer = Beer.find li.beer_id
      cart_total << (beer.price * li.quantity)
      total = cart_total.reduce(:+)
      p beer.title
    end
    total
  end

  def add_beer(beer_id)
    current_item = line_items.find_by_beer_id(beer_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(beer_id: beer_id)
    end
    current_item
  end
end
