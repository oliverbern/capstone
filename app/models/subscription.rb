class Subscription < ActiveRecord::Base
	validates_presence_of :plan_id, :user
	attr_accesor :card

	def process!
		if !user.customer
			customer = Stripe::Customer.create(
	 			:source => {card: card},
	  			:plan => plan_id,
	  			:email => user.email
  			)
  			user.update_attribute(:stripeid, customer.id)
		end
	end


end
