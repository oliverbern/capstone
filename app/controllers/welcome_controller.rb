class WelcomeController < ApplicationController
	def ownerlist
		@colorgems = Colorgem.all.where(owner: current_user)

		respond_to do |format|
			format.html
			format.csv { send_data @colorgems.to_csv}
			format.xls { send_data @colorgems.to_csv(col_sep: "\t") }
		end


		
	end
end
