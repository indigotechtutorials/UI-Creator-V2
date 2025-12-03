module ApplicationHelper
  def current_ui_library
    @_current_ui_library ||= UiLibrary.find_by_id(session[:ui_library_id])
  end
end
