class ApplicationController < ActionController::Base
  include ApplicationHelper

  layout :layout_manager
  before_action :configure_devise_parameters, if: :devise_controller?

 
  private

  def layout_manager
   	Utilities::LayoutManager.call(
   		controller_name: params[:controller],
   	 	action_name: params[:action] 
   	)
  end

  def configure_devise_parameters
  	devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:pseudo, :email, :password, :password_confirmation)}
  end

end
