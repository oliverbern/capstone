class Colorgem < ActiveRecord::Base

	has_attached_file :image, :styles => { :medium => "50x50", :thumb => "100x100", :large => "300x300" }, :default_url => "default.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/



	belongs_to :user


	#validates_presence_of :user



	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |colorgem|
				csv << colorgem.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file, current_user)
		#CSV.foreach(file.path, headers: true) do |row|
			#colorgem = find_by_id(row["id"]) || new
			#colorgem.attributes = row.to_hash.slice(*accessible_attributes)
			#colorgem.save!
			#Colorgem.create! row.to_hash
		#end


		spreadsheet = open_spreadsheet(file)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			colorgem = current_user.colorgems.find_by_id(row["id"]) || new #allows only to access own listings
			colorgem.attributes = row.to_hash.slice(*Colorgem.attribute_names())
			colorgem.user_id = current_user.id
			colorgem.save!
		end
	end

	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
		when '.csv' then CSV.new(file.path, nil, :ignore)
		when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
		when '.xlsx' then Excelx.new(file.path, nil, :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end


end




