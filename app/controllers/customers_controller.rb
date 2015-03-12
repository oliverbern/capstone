class CustomersController < ApplicationController
	def create
		current_user.create_customer(params[:customer])
		redirect_to root_path
	end
end
