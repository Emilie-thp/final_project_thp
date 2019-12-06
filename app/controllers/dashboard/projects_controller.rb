module Dashboard

	class ProjectsController < ApplicationController
		layout 'dashboard'
		
		def index
			@projects = Project.all
		end

	  def new
	    @project = Project.new
	  end

	  def create
			@project = Project.new(project_params)
			@project.admin = current_admin
			if @project.save
	    	flash[:notice] = "Une nouvelle réalisation a bien été créée (n°#{@project.id})!"
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
	end
end
