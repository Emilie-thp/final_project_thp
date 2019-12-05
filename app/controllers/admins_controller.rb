class AdminsController < ApplicationController
 	layout 'dashboard'
	before_action :authenticate_admin!

  def show
  	@admin = Admin.find(params[:id])
  end

end
