module Dashboard 
  class AvatarsController < ApplicationController
    
    def show
			@admin = Admin.find(params[:admin_id])
		end

		def create
	    @admin = Admin.find(params[:admin_id])
	    @admin.avatar.attach(params[:avatar])
	    redirect_to edit_dashboard_admin_path(@admin)
	  end

	  def destroy
	    @admin = Admin.find(params[:admin_id])
		  @admin.avatar.purge
		  redirect_to edit_dashboard_admin_path(@admin)
	  end

  end
end
