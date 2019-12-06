module Dashboard

  class PicturesController < ApplicationController
    
    def create
      @project = Project.find(params[:project_id])
      @project.pictures.attach(params[:pictures])
      redirect_to edit_dashboard_project_path(@project)
    end

    def destroy
      @project = Project.find(params[:project_id])
      @project.picture.spurge
      redirect_to edit_dashboard_project_path(@project)
    end

  end

end
