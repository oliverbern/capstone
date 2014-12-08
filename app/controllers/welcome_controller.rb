class WelcomeController < ApplicationController
	def ownerlist
		@colorgems = Colorgem.where(user_id: current_user.id)
		@diamonds = Diamond.where(user_id: current_user.id)
		@jewelleries = Jewellery.where(user_id: current_user.id)
		@colordiamonds = Colordiamond.where(user_id: current_user.id)
		@colorgemspag = @colorgems.paginate(page: params[:page], per_page: 10)
		
		case params[:source]
		when 'colorgems' 
			csv_output = @colorgems
		when 'diamonds'
			csv_output = @diamonds
		when 'jewelleries'
			csv_output = @jewelleries
		when 'colordiamonds'
			csv_output = @colordiamonds
		else
			csv_output = @colorgems
		end

		respond_to do |format|
			format.html
			format.csv { send_data csv_output.to_csv}
			format.xls { send_data csv_output.to_csv(col_sep: "\t") }
		end

		
		

	end

	def import

		case params[:source]
		when 'colorgems' 
			input = Colorgem
		when 'diamonds'
			input = Diamond
		when 'jewelleries'
			input = Jewellery
		when 'colordiamonds'
			input = Colordiamond
		else
			input = Colorgem
		end

		input.import(params[:file], current_user)
		redirect_to  welcome_ownerlist_path, notice: "Products imported."
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
