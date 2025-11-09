class ColorSchemeController < ApplicationController
  def create
    @name = params[:name]
    @color = params[:color]

    session[:color_scheme][@name] = @color
  end
end