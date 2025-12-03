class UiLibrariesController < ApplicationController
  def new
    @ui_library = UiLibrary.new
  end

  def create
    if @ui_library = UiLibrary.create(ui_library_params)
      session[:ui_library_id] = @ui_library.id
      redirect_to root_path
    end
  end
private
  def ui_library_params
    params.expect(ui_library: [:name])
  end
end