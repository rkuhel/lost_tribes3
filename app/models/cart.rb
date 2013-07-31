class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy 
	before_destroy :ensure_not_referenced_by_line_item 
end
