class Diamond < ActiveRecord::Base
	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item



	private

	#ensure that there are no line items referencing this product

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			error.add(:base, 'Line Items present')
			return false
		end
	end
end
