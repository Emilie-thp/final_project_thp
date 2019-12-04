module Admin

	class ArticlesController < ApplicationController

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
	    @article = Article.create(article_params)
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
