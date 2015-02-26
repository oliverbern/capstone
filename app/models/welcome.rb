class Welcome < ActiveRecord::Base
		
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |colorgem|
        csv << colorgem.attributes.values_at(*column_names)
      end
    end
  end

	def self.import(source, file, current_user)
		
		case source
		when 'colorgems' 
			input = Colorgem
		when 'diamonds'
			input = Diamond
		when 'jewelleries'
			input = Jewellery
		when 'colordiamonds'
			input = Colordiamond
		else
			input = Colorgem
		end

		spreadsheet = open_spreadsheet(file)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			gemstonestype = row['gemstonetype']
			if gemstonestype == nil
			  next
			else
				colorgem = current_user.public_send(source).find_by_id(row["id"]) || current_user.public_send(source).build
				colorgem.attributes = row.to_hash.slice(*input.attribute_names())
				colorgem.user_id = current_user.id
				colorgem.image = File.open(Path.join('sdadsadsda', row['file']))
				colorgem.save!
			end
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