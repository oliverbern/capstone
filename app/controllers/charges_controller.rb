class ChargesController < ApplicationController
	 def create
 
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 9000,
     description: "Silver Plan Membership - #{current_user.email}",
     currency: 'chf'
   )

   current_user.update! role: :silveruser
 
   flash[:success] = "Thank you for your payment, your account with the email #{current_user.email}) has now been upgraded!"
   redirect_to welcome_ownerlist_path
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
  end

  def upgrade
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Silver Plan Membership - #{current_user.name}",
     amount: 9000
   }
 end

end
