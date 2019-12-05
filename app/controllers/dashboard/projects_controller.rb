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
			redirect_to dashboard_projects_path
		 else
			new_dashboard_project_path
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
	  end

	  def destroy
	    @project = Project.find(params[:id])
	  end

	  private

	  def project_params
	    params.require(:project).permit(:title, :description, :content, :date, :published)
	  end

	end

end

