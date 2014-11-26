class Colorgem < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :owner



	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |colorgem|
				csv << colorgem.attributes.values_at(*column_names)
			end
		end
	end
end
