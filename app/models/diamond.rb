class Diamond < ActiveRecord::Base
	
	belongs_to :user

	#validates_presence_of :user

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |diamond|
				csv << diamond.attributes.values_at(*column_names)
			end
		end
	end

end
