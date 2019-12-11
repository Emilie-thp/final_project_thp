module Dashboard

	class ProjectsController < ApplicationController
  	layout 'application', :only => :show
		layout 'dashboard', :except => :show
		before_action :authenticate_admin!
		before_action :secret, only: [:edit, :update, :destroy]


		def index
			@projects = Project.all
			@current_projects = Project.where(admin_id: current_admin.id)
		end

	  def new
	    @project = Project.new
	    @categories = Category.all
	  end

	  def create
			@project = Project.new(project_params)
			@project.admin = current_admin
			@project.categories << params[:categories]
			if @project.save
	    	flash[:notice] = "Une nouvelle réalisation a bien été créée (n°#{@project.id})! Merci d'ajouter les photos avant de la publier."
				redirect_to edit_dashboard_project_path(@project)
		 	else
				render "new"
		 	end
	  end

	  def show
	    @project = Project.find(params[:id])
	  end

	  def edit
	    @project = Project.find(params[:id])
	  end

	  def update
	    @project = Project.find(params[:id])
	    if @project.update(project_params)
	    	flash[:notice] = "La réalisation n°#{@project.id} a bien été éditée !"
				redirect_to dashboard_projects_path
			else
				render "edit"
	  	end
	  end

	  def destroy
	    @project = Project.find(params[:id])
	    @project.destroy
    	flash[:notice] = "La réalisation n°#{@project.id} a bien été supprimée !"
    	redirect_to dashboard_projects_path
	  end

	
	  private

	  def project_params
	    params.require(:project).permit(:title, :description, :content, :date, :published)
	  end

  	def secret
		@project = Project.find(params[:id])
		@admin = Admin.find(@project.admin_id)
			unless @admin.id == current_admin.id
				flash[:notice] = "Vous n'avez pas le droit d'éditer ou supprimer le projet car vous n'êtes pas l'auteur !"
				redirect_to dashboard_projects_path
			end
		end

	end

end
