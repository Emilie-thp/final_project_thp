class ProjectsController < ApplicationController

  def index
    @categories = Category.all

    #if condition is here to sort projects out regarding their categories (params :category in view)
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
