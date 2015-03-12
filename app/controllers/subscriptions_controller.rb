class SubscriptionsController < ApplicationController
	def create


		current_user.create_customer(params[:customer])
		




		# @subscription = current_user.subscription.build(params[:subscription])
		# if subscription.save
		# 	redirect_to root_path
		# else
		# 	render :new
		# end
	end

	private 

	def colorgem_params
      params.require(:subscription).permit(:plan, :card,)
end
