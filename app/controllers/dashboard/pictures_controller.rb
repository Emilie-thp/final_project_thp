module Dashboard

  class PicturesController < ApplicationController

    def create
      @project = Project.find(params[:project_id])
      @project.pictures.attach(params[:pictures])
      redirect_to edit_dashboard_project_path(@project)
    end

    def destroy
      @project = Project.find(params[:project_id])
      @pictures = ActiveStorage::Attachment.where(record_id: params[:project_id])
      @pic_to_delete = @pictures.find_by(blob_id: params[:id])
      @pic_to_delete.purge
      redirect_to edit_dashboard_project_path(@project)
    end

  end

end

