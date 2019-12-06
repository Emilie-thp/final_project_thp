module Dashboard

	class ArticlesController < ApplicationController
		layout 'dashboard'
		before_action :authenticate_admin!
		before_action :secret, only: [:edit, :update, :destroy]

		def index
			@articles = Article.all
		end

		def new
			@article = Article.new
		end

	 	def create
			@article = Article.new(article_params)
			@article.admin = current_admin
			if @article.save
				flash[:notice] = "Un nouvel article a bien été créé (n°#{@article.id})!"
				redirect_to edit_dashboard_article_path(@article)
			else
				render "new"
			end
		end

		def show
	    @article = Article.find(params[:id])
	  end

		def edit
			@article = Article.find(params[:id])
	  end

	  def update
			@article = Article.find(params[:id])
			if @article.update(article_params)
	    	flash[:notice] = "L'article n°#{@article.id} a bien été édité !"
				redirect_to dashboard_articles_path
			else
				render "edit"
	  	end
		end

	  def destroy
			@article = Article.find(params[:id])
			@article.destroy
    	flash[:notice] = "L'article n°#{@article.id} a bien été supprimé !"
    	redirect_to dashboard_articles_path
	  end

		def secret
			@article = Article.find(params[:id])
			@admin = Admin.find(@article.admin_id)
	 			unless @admin.id == current_admin.id
					flash[:notice] = "Vous n'avez pas les droits d'accès !"
					redirect_to dashboard_articles_path
		end
 end

	  private

	  def article_params
	    params.require(:article).permit(:title, :description, :content, :published)
		end
	end
end
