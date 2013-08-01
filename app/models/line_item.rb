class LineItem < ActiveRecord::Base
  # attr_accessible :beer_id, :cart_id

	belongs_to :beer
	# belongs_to :event
	belongs_to :cart
end
