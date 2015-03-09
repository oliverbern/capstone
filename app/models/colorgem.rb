class Colorgem < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	#has_attached_file :image, :styles => { :medium => "50x50", :thumb => "100x100", :large => "300x300" }, :default_url => "default.png"
	#validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	belongs_to :user

	enum listingstatus: [:active, :disabled, :sold]


	#validates_presence_of :user

	def self.to_csv(user_id)
    exportgems = Colorgem.where(user_id: user_id)
		csv_string = CSV.generate do |csv|
      csv << ["Listing No.", "Type", "Color","Shape", "User ID"]
      exportgems.each do |item|
        csv << [item.id, item.gemstonetype, item.color, item.shape, item.user_id]
      end
    end
  end 

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		Colorgem.create!(row.to_hash)
  	end
  end
  


end
