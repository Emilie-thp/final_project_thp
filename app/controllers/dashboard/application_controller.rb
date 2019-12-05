module Dashboard

	class ApplicationController < ::ApplicationController

		def show
			@admin = Admin.find(params[:id])
		  end
	end

end