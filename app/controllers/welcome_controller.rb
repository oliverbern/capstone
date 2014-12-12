class WelcomeController < ApplicationController
	def ownerlist
		@colorgems = Colorgem.where(user_id: current_user.id)
		@diamonds = Diamond.where(user_id: current_user.id)
		@jewelleries = Jewellery.where(user_id: current_user.id)
		@colordiamonds = Colordiamond.where(user_id: current_user.id)
		@colorgemspag = @colorgems.paginate(page: params[:page], per_page: 10)
		@diamondspag = @diamonds.paginate(page: params[:page], per_page: 10)
		@jewelleriespag = @jewelleries.paginate(page: params[:page], per_page: 10)
		@colordiamondspag = @colordiamonds.paginate(page: params[:page], per_page: 10)   

		respond_to do |format|
			format.html	
		end
	end

	def export
       model_name = params[:source].capitalize
       stones = model_name.constantize.where(user: current_user)

	   #csv_output = instance_variable_get("@#{params[:source] || 'colorgems'}")
       respond_to do |format|	
			format.csv { send_data stones.to_csv}
			format.xls { send_data stones.to_csv(col_sep: "\t") }
		end

	end

	def import
		Welcome.import(params[:source], params[:file], current_user)
		redirect_to  welcome_ownerlist_path, notice: "Products imported."
	end
end
