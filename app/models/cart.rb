class Cart < ActiveRecord::Base
	has_many :line_items, dependet: :destroy
end
