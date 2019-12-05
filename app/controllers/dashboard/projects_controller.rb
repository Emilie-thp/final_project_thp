module Dashboard

	class ProjectsController < ApplicationController

		def index
	    @project = Project.all
	  end

	  def new
	    @project = Project.new
	  end

	  def create
		@project = current_user.project
	   	@project = Project.create(project_params)
	   	@project.pictures.attach(params[:pictures])
	   	redirect_to new_dashboard_project_path

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

