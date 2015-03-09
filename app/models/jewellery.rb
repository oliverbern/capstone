class Jewellery < ActiveRecord::Base
	

	belongs_to :user

	enum listingstatus: [:active, :disabled, :sold]

	#validates_presence_of :user

end
