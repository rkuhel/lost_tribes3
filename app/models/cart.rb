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

  def increment_item(line_item)
    if (self.line_items.include? line_item)
      line_item.quantity += 1
      line_item.save
    else
      p "Not in this cart"
    end
  end

  def decrement_item(line_item)
    if (self.line_items.include? line_item)
      line_item.quantity -= 1
      if line_item.quantity < 1
        line_item.delete
      else
        line_item.save
      end
    else
      p "Not in this cart"
    end
  end
end
