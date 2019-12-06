module Dashboard

	class ArticlesController < ApplicationController
		layout 'dashboard'

		def index
			@articles = Article.all
		end 

	  def show
	    @article = Article.find(params[:id])
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

	  def edit
	  end

	  def update
	    @article = Article.find(params[:id])
	    @article.update(article_params)
	  end

	  def destroy
	    @article = Article.find(params[:id])
	  end

	  private

	  def article_params
	    params.require(:article).permit(:title, :description, :content, :published)
	  end

	end

end
