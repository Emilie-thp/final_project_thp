module Dashboard

  class AdminsController < ApplicationController
   	layout 'dashboard'
  	before_action :authenticate_admin!
    before_action :secret, only: [:show]

    def show
    	@admin = Admin.find(params[:id])
    end

    def edit 
      @admin = Admin.find(params[:id])
    end

    private

    def secret
      @admin = Admin.find(params[:id])
        unless @admin.id == current_admin.id
          flash[:notice] = "Vous n'avez pas les droits d'accès au dashboard d'un autre admin!"
          redirect_to admin_path(current_admin)
        end
    end

  end

end