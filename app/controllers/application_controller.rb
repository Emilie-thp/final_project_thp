class ApplicationController < ActionController::Base
  include ApplicationHelper

  layout :layout_manager
  before_action :configure_devise_parameters, if: :devise_controller?

  private

  #method to call the LayoutManager service that centralizes the choice of the layout for the view based on the targeted controller and action.
  def layout_manager
    Utilities::LayoutManager.call(
        controller_name: params[:controller],
        action_name: params[:action]
    )
  end

  #devise method to add an additional parameters to sign_up (pseudo)
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:pseudo, :email, :password, :password_confirmation) }
  end

end
