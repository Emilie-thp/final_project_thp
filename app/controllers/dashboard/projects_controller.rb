module Dashboard

  class ProjectsController < ApplicationController
    before_action :authenticate_admin!
    before_action :secret, only: [:edit, :update, :destroy]

    def index
      @projects = Project.all
      @current_projects = Project.where(admin_id: current_admin.id).order('created_at DESC')
    end

    def show
      @project = Project.find(params[:id])
    end

    def new
      @project = Project.new
      @categories = Category.all
    end

    def create
      @project = Project.new(project_params)
      @project.admin = current_admin
      @categories = Category.all
      if @project.save
        #unless the case when one admin does not check any box
        unless params[:project][:categories] == nil
          category_array = params[:project][:categories]
          category_array.each do |category|
            @project.categories << Category.find(category)
          end
        end
        flash[:notice] = "Vous venez de créer une nouvelle réalisation. Ajoutez des photos et relisez les informations avant de la mettre en ligne !"
        redirect_to edit_dashboard_project_path(@project)

      else
        render "new"
      end
    end

    def edit
      @project = Project.find(params[:id])
      @categories = Category.all
      @current_categories = @project.categories
    end

    def update
      @project = Project.find(params[:id])
      @categories = Category.all
      @current_categories = @project.categories
      if @project.update(project_params)
				#unless the case when one admin does not check any box
        unless params[:project][:categories] == nil
          category_array = params[:project][:categories]
          #empty @project.categories to remove all the previous categories and take into account the new ones
          @project.categories = []
          category_array.each do |category|
            @project.categories << Category.find(category)
          end
        end
        flash[:notice] = "La réalisation '#{@project.title}' a bien été éditée !"
        redirect_to dashboard_projects_path
      else
        render "edit"
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.pictures.purge
      @project.destroy
      respond_to do |format|
        format.html do
          flash[:notice] = "La réalisation '#{@project.title}' a bien été supprimée !"
          redirect_to dashboard_projects_path
        end
        format.js do
        end
      end
    end

    #another update method to update only the published column (bolean)
    def update_published
      @project = Project.find(params[:id])
      if @project.published
        @project.update(published: false)
        redirect_to edit_dashboard_project_path(@project)
        flash[:notice] = "Votre réalisation vient d'être mise hors ligne !"
      else
        @project.update(published: true)
        flash[:notice] = "Votre réalisation vient d'être mise en ligne !"
        redirect_to edit_dashboard_project_path(@project)
      end
    end

    private

    def project_params
      params.require(:project).permit(:title, :description, :content, :date, :published)
    end

		#method to prevent one admin to edit or destroy another admin's projects
    def secret
      @project = Project.find(params[:id])
      @admin = Admin.find(@project.admin_id)
      unless @admin.id == current_admin.id
        flash[:notice] = "Vous n'avez pas le droit d'éditer ou supprimer cette réalisation car vous n'êtes pas l'auteur !"
        redirect_to dashboard_projects_path
      end
    end

  end

end
