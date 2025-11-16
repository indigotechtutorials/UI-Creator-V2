# frozen_string_literal: true

class ColorSchemePreviewComponent < ViewComponent::Base
  attr_reader :name, :color
  def initialize(name, color)
    @name = name
    @color = color
  end

  def display_name
    name.split(/_|-/).join(" ")
  end
end
