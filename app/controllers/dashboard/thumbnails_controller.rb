module Dashboard

class ThumbnailsController < ApplicationController

	 def create
    @project = Project.find(params[:project_id])
    @project.thumbnails.attach(params[:thumbnails])
    redirect_to edit_dashboard_project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
	  @project.thumbnails.purge
	  redirect_to edit_dashboard_project_path(@project)
  end

end
