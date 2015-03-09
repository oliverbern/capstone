class ExportController < ApplicationController
	def colorgemexport
		respond_to do |format|
    	format.csv {send_data Colorgem.to_csv(current_user.id),:type => 'text/csv; charset=iso-8859-1; header=present', :filename => "colorgems_export_of_user_#{current_user.id}.csv"}
    	format.xls {send_data Colorgem.to_csv(current_user.id), :type =>  "application/vnd.ms-excel",:filename => "colorgems_export_of_user_#{current_user.id}.xls"}
    end
   end
end
