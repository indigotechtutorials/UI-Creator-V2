class AppUiSettingsController < ApplicationController
  def show
    @type = params[:type] || "manual_select"
  end

  def create
    @name = params[:name]
    @color = params[:color]

    session[:internal_app_color_scheme][@name] = @color
    head :ok
  end
end