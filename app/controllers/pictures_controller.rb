class PicturesController < ApplicationController
  def create
    @project_picture = Project.find(params[:project_id])
    @project_picture.pictures.attach(params[:pictures])
    redirect_to new_project_path(@project_picture))
  end

  def destroy
    @project_picture = Project.find(params[:project_id])
	  @project_picture.pictures.purge
	  redirect_to project_path(@project_picture)
  end
end
