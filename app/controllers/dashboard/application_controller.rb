module Dashboard

	class ApplicationController < ::ApplicationController

		def show
			@admin = Admin.find(params[:id])
			@projet = Projet.find(params[:id])
			@article = Article.find(params[:id])
		  end
	end

end