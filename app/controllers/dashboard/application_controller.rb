module Dashboard

	class ApplicationController < ::ApplicationController
		layout 'dashboard'

		def index
			@admin = Admin.find(params[:id])
			@project = Project.find(params[:id])
			@article = Article.find(params[:id])
			@category = Category.find(params[:id])
		end

	end

end


