module Dashboard

	class ArticlesController < ApplicationController
		layout 'dashboard'

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

	  private

	  def article_params
	    params.require(:article).permit(:title, :description, :content, :date, :published)
	  end
	end
end
