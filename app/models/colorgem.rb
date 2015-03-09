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
      csv << ["gemstonetype", "user_id", "id", "color","shape","length","height","width","weight","image_file_name","gemscertificate","colorbrightness","transparency","clarity","treatment","gemsunit","showprice","image","price","listingstatus","secondcolor"]
      exportgems.each do |item|
        csv << [item.gemstonetype, item.user_id, item.id, item.color, item.shape,item.length,item.height,item.width,item.weight,item.image_file_name,item.gemscertificate,item.colorbrightness,item.transparency,item.clarity,item.treatment,item.gemsunit,item.showprice,item.image,item.price,item.listingstatus,item.secondcolor]
      end
    end
  end 

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		Colorgem.create!(row.to_hash)
  	end
  end
  


end
