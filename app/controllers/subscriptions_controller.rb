class SubscriptionsController < ApplicationController
	def create


		current_user.create_customer(params[:customer])
		
	end

	private 

	def customer_params
      params.require(:subscription).permit(:plan, :card => {})
  end
end
