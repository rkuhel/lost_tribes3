class LineItem < ActiveRecord::Base
	belongs_to :beer
	belongs_to :event
	belongs_to :cart
end
