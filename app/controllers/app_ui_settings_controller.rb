class AppUiSettingsController < ApplicationController
  def show
    @type = params[:type] || "auto_gen"
  end

  def create
    @multiple_colors = params[:multiple_colors]
    if @multiple_colors
      @multiple_colors.each do |color|
        session[:internal_app_color_scheme][color[0]] = color[1]
      end
    else
      @name = params[:name]
      @color = params[:color]

      session[:internal_app_color_scheme][@name] = @color
    end
    head :ok
  end
end