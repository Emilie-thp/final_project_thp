module Dashboard

	class CategoriesController < ApplicationController
    layout 'dashboard'

		def index
			@categories = Category.all
		end

	  def new
      @category = Category.new  
    end
  
    def create
      @category = Category.create(params[:category_name])
    end
  
    def edit 
      @category = Category.find(params[:id])
    end 

    def update
      @category = Category.find(params[:id])
        if @category.update(category_name: params[:category_name])
          flash[:notice] = "La catégorie a bien été mise à jour !"
          redirect_to dashboard_categories_path
        else
          render "edit"
        end
    end
  
    def destroy
      @category = Category.find(params[:id])
  	end

	end

end