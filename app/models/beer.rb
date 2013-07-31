class Beer < ActiveRecord::Base

	has_many :line_items, dependent: :destroy 
	before_destroy :ensure_not_referenced_by_line_item 

	private 
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else 
				errors.add(:base, 'Line items present')
				return false
			end
		end
		
end


