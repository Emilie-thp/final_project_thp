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

    def update
      @admin = Admin.find(params[:id])
      if @admin.update(admin_params)
        redirect_to edit_dashboard_admin_path
        flash[:notice] = "Modifications prises en compte"
      else
        render "edit"
      end
    end

    private

    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :pseudo)
    end

    def secret
      @admin = Admin.find(params[:id])
        unless @admin.id == current_admin.id
          flash[:notice] = "Vous n'avez pas les droits d'accès au dashboard d'un autre admin!"
          redirect_to admin_path(current_admin)
        end
    end

  end

end