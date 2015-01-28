class Colorgem < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	#has_attached_file :image, :styles => { :medium => "50x50", :thumb => "100x100", :large => "300x300" }, :default_url => "default.png"
	#validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	belongs_to :user

	enum listingstatus: [:active, :disabled, :sold]


	#validates_presence_of :user


end




