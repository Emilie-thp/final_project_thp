module Admin

	class CategoriesController < ApplicationController

		def index
			@categories = Category.new
		end

	  def new
      @category = Category.new  
    end
  
    def create
      @category = Category.create(params[:category_name])
    end
  
    def update
      @category = Category.find(params[:id])
      @category.update(params[:category_name])
    end
  
    def destroy
      @category = Category.find(params[:id])
  	end

	end

end