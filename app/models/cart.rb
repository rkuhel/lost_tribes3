class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  # before_destroy :ensure_not_referenced_by_any_line_item
  belongs_to :user
  attr_accessible :current, :shipped

  def total_up_cart
    total = 0
    cart_total = []
    self.line_items.each do |li|
      if li.beer_id
        li.beer_id
        beer = Beer.find li.beer_id
        cart_total << (beer.price * li.quantity)
      else
        li.event_id
        event = Event.find li.event_id
        cart_total << (event.price * li.quantity)
      end
      total = cart_total.reduce(:+)
      # p beer.title
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

  # def add_event(event_id)
  #   current_item = line_items.find_by_event_id(event_id)
  #   if current_item
  #     current_item.quantity += 1
  #   else
  #     current_item = line_items.build(event_id: event_id)
  #   end
  #   current_item
  # end
end
