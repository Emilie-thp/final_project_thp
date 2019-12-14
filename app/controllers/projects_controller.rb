class ProjectsController < ApplicationController

  def index
    @categories = Category.all

    #condition to sort projects out depending on their categories (thanks to a params :category in view index)
    if params.has_key?(:category)
      @category = Category.find_by(category_name: params[:category])
      @projects = @category.projects.where(published: true).order('created_at DESC')
    else
      @projects = Project.where(published: true).order('created_at DESC')
    end

  end

  def show
    @project = Project.find(params[:id])
  end

end
