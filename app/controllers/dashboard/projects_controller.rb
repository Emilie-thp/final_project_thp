module Dashboard

	class ProjectsController < ApplicationController

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
	    	flash[:notice] = "Une nouvelle réalisation a bien été créée !"
				redirect_to root_path
		 	else
				render root_path
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
	    @project.update(project_params)
			redirect_to root_path
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

