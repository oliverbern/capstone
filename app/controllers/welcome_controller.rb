class WelcomeController < ApplicationController
	def ownerlist
		@colorgems = Colorgem.where(user_id: current_user.id)
		@colorgemspag = @colorgems.paginate(page: params[:page], per_page: 10)
	end

	#def import
	#	Welcome.import(params[:source], params[:file], current_user)
	#	redirect_to  welcome_ownerlist_path, notice: "Products imported."
	#end
end
