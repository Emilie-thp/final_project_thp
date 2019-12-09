class ProjectsController < ApplicationController

  def index
    @categories = Category.all
    if params.has_key?(:category)
    	@category = Category.find_by(category_name: params[:category])
    	@projects = @category.projects
    else
 		  @projects = Project.all
 		end
  end

  def show
    @project = Project.find(params[:id])
  end

end
