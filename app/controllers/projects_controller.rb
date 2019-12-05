class ProjectsController < ApplicationController
  layout  'pages_simple', :only =>  :show

  def index
    @project = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

end
