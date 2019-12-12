module Dashboard

	class CategoriesController < ApplicationController
    
		def index
			@categories = Category.all
		end

	  def new
      @category = Category.new  
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "La catégorie #{@category.category_name} a été créée !"
        redirect_to dashboard_categories_path
      else
        render "new"
      end
    end
  
    def edit 
      @category = Category.find(params[:id])
    end 

    def update
      @category = Category.find(params[:id])
        if @category.update(category_params)
          flash[:notice] = "La catégorie #{@category.category_name} a bien été mise à jour !"
          redirect_to dashboard_categories_path
        else
          render "edit"
        end
    end
  
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      flash[:notice] = "La catégorie a bien été supprimée !"
      redirect_to dashboard_categories_path
  	end


    private

    def category_params
      params.require(:category).permit(:category_name)
    end



	end

end