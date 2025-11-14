# frozen_string_literal: true

class UiComponentSectionComponent < ViewComponent::Base
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def source_code_content
    render(partial:"ui_components/#{name}s/preview").to_str
  end
end
