class UiComponentsController < ApplicationController
  def index
    redirect_to new_ui_library_path if !current_ui_library
  end
end
