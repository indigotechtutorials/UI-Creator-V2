class ColorSchemeController < ApplicationController
  def create
    @name = params[:name].split("-").join("_")
    @color = params[:color]

    session[:color_scheme][@name] = @color
    head :ok
  end
end