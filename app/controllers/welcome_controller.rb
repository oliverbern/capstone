class WelcomeController < ApplicationController
	def ownerlist
		@colorgems = Colorgem.all.where(user_id: current_user)
		@diamonds = Diamond.all.where(user_id: current_user)
		@jewelleries = Jewellery.all.where(owner: current_user)
		@colordiamonds = Colordiamond.all.where(user_id: current_user)
		@colorgemspag = Colorgem.all.where(user_id: current_user).paginate(page: params[:page], per_page: 10)
		current_user.colordiamonds #same as above - need to change user model to has_many ...

		respond_to do |format|
      format.html
      format.csv { send_data @allcolorgems.to_csv}
      format.xls { send_data @allcolorgems.to_csv(col_sep: "\t") }
    	end
			
		

	end

	def export_jewellery
		@jewelleries = Jewellery.all.where(owner: current_user)

		respond_to do |format|
			format.csv { send_data @colorgems.to_csv}
			format.xls { send_data @colorgems.to_csv(col_sep: "\t") }
		end

	end

	def homepageinfo
		@colorgems = Colorgem.all

	end



	



end
