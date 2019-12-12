##
# When a request is made in the application, it is processed by the targeted action of the targeted controller.
# Each action that renders a view needs a layout parameter.
# This service centralizes the choice of the layout for the view based on the targeted controller and action.
#
# Input :
# - controller_name: string
# - action_name: string
#
# Output :
# - string
#
# Example :
# Utilities::LayoutManager.call(controller_name: 'dashboard/articles', action_name: 'show')
# => 'static_pages'

module Utilities

  class LayoutManager

    DISPLAY_DASHBOARD = %w[dashboard/admins dashboard/categories dashboard/contacts].freeze
    DISPLAY_DASHBOARD_EXCEPT_SHOW = %w[dashboard/articles dashboard/events dashboard/projects].freeze
    DISPLAY_DASHBOARD_FOR_DEVISE = %w[devise/registrations].freeze

    class << self

      def call(controller_name:, action_name:)
        case controller_name
        when 'static_pages' then 'static_pages'
        when *DISPLAY_DASHBOARD then 'dashboard'
        when *DISPLAY_DASHBOARD_EXCEPT_SHOW then dashboard_except_show(action_name)
        when *DISPLAY_DASHBOARD_FOR_DEVISE then devise_route_to_dashboard(action_name)
        else
          'application'
        end
      end

      private

      def dashboard_except_show(action_name)
        action_name == 'show' ? 'application' : 'dashboard'
      end

      def devise_route_to_dashboard(action_name)
        action_name == 'edit' ? 'dashboard' : 'application'
      end

    end

  end

end