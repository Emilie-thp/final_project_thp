class StaticPagesController < ApplicationController

  def home
    @projects = Project.all
  end

  def index
    @project = Project.find(params[:id])
  end

end
