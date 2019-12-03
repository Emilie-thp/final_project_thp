class CategoriesController < ApplicationController

    def new
        @category = Category.new
    
      end
    
      def create
      
       @category = Category.create(params[:category_name])
    
      end
    
      def update
      
        @category = Category.find(params[:id])
    
      end
    
      def destroy
        @category = Category.find(params[:id])
    
      end
    
end
