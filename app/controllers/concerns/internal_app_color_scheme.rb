require "active_support/concern"

# Sets the default color scheme for the apps UI ( not related to users UI library )

module InternalAppColorScheme
  extend ActiveSupport::Concern
  included do
    before_action :set_internal_app_color_scheme
    
    private
      def set_internal_app_color_scheme
        @internal_app_color_scheme ||= OpenStruct.new(find_or_create_internal_app_color_scheme)
      end

      def find_or_create_internal_app_color_scheme
        if session[:internal_app_color_scheme].present?
          session[:internal_app_color_scheme]
        else
          session[:internal_app_color_scheme] = {
            header: "253°, 0%, 0%",
          }
          session[:internal_app_color_scheme]
        end
    end
  end
end