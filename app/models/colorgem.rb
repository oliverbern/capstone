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
    index = 1
    #begin

  	  CSV.foreach(file.path, headers: true) do |row|
        #index = index + 1
  		  Colorgem.create! row.to_hash#.merge({user_id: @colorgem.user_id})
        
  	  end
     #rescue UTF8Exception => e
     #   flash[:error] = "You have UTF( progblem in line #{index+1}. Fix and return."
     #rescue Exception => e
     #   flash[:error] = 'I got an unkown error. try again.'
     #end
  end
end

