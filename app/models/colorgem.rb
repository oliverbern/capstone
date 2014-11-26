class Colorgem < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :owner
end
