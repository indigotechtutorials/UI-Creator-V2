# frozen_string_literal: true

class UiComponentSectionComponent < ViewComponent::Base
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def source_code_content
    File.read("app/views/ui_components/#{name}s/preview.html")
  end
end
