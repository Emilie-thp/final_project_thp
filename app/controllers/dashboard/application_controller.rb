module Dashboard

	class ApplicationController < ::ApplicationController
		layout 'dashboard'

		def index
			@admin = Admin.find(params[:id])
			
		end

	end

end


