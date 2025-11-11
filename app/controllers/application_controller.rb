require "ostruct"

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_color_scheme

private
  def set_color_scheme
    @color_scheme ||= OpenStruct.new(find_or_create_color_scheme)
  end

  def find_or_create_color_scheme
    if session[:color_scheme].present?
      session[:color_scheme]
    else
      session[:color_scheme] = {
        black: "hsl(253, 69%, 5%)",
        dark_gray: "hsl(268, 12%, 24%)",
        light_gray: "hsl(258, 16%, 66%)",
        white: "hsl(249, 33%, 96%)",
        red: "hsl(0, 82%, 48%)",
        green: "hsl(125, 68%, 40%)",
        primary: "hsl(270, 50%, 54%)",
        secondary: "hsl(211, 68%, 57%)",
      }
      session[:color_scheme]
    end
  end
end