class ImportController < ApplicationController
	def import
		Colorgem.import(params[:file])
		redirect_to welcome_ownerlist_path, notice: "Successful Import"
	end
end
