class PicturesController < ApplicationController
  
  def create
    @project = Project.find(params[:project_id])
    @project.picture.attach(params[:picture])
    redirect_to edit_dashboard_project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @project.picture.purge
    redirect_to edit_dashboard_project_path(@project)
  end

end
