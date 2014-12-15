module ColorgemsHelper
	def persist_search
		to_return = Hash.new

		if params[:q] && params[:q][:gemstonetype_cont]
			to_return[:gemstonetype_cont] = params[:q][:gemstonetype_cont]
		end

		to_return.empty? ? {} : to_return
	end
end
