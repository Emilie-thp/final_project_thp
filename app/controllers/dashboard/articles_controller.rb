module Dashboard

  class ArticlesController < ApplicationController
    before_action :authenticate_admin!
    before_action :secret, only: [:edit, :update, :destroy]

    def index
      @articles = Article.all.order('created_at DESC')
      @current_articles = Article.where(admin_id: current_admin.id)
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
        flash[:notice] = "Vous venez de créer un nouvel article. Ajoutez une photo et relisez les informations avant le mettre en ligne !"
        redirect_to edit_dashboard_article_path(@article)
      else
        render "new"
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:notice] = "L'article '#{@article.title}' a bien été édité !"
        redirect_to dashboard_articles_path
      else
        render "edit"
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      respond_to do |format|
        format.html do
          flash[:notice] = "L'article '#{@article.title}' a bien été supprimé !"
          redirect_to dashboard_articles_path
        end
        format.js do
        end
      end
    end

    #another update method to update only the published column (boolean)
    def update_published
      @article = Article.find(params[:id])
      if @article.published
        @article.update(published: false)
        redirect_to edit_dashboard_article_path(@article)
        flash[:notice] = "Votre article vient d'être mis hors ligne !"
      else
        @article.update(published: true)
        flash[:notice] = "Votre article vient d'être mis en ligne !"
        redirect_to edit_dashboard_article_path(@article)
      end
    end


    private

    def article_params
      params.require(:article).permit(:title, :description, :content, :published)
    end

    #method to prevent one admin to edit or destroy another admin's articles
    def secret
      @article = Article.find(params[:id])
      @admin = Admin.find(@article.admin_id)
      unless @admin.id == current_admin.id
        flash[:notice] = "Vous n'avez pas le droit d'éditer ou supprimer l'article car vous n'êtes pas l'auteur !"
        redirect_to dashboard_articles_path
      end
    end

  end

end
