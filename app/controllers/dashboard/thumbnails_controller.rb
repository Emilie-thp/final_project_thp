module Dashboard

  class ThumbnailsController < ApplicationController

    def create
      @project = Project.find(params[:project_id])
      @project.thumbnail.attach(params[:thumbnail])
      redirect_to edit_dashboard_project_path(@project)
    end

    def destroy
      @project = Project.find(params[:project_id])
      @project.thumbnail.purge
      redirect_to edit_dashboard_project_path(@project)
    end

  end

end
