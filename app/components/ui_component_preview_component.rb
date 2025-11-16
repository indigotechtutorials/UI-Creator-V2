# frozen_string_literal: true
# For components that only need a single preview partial used buttons, etc.. 

class UiComponentPreviewComponent < ViewComponent::Base
  attr_reader :name, :partial_path, :description, :header_text, :allow_og_pos
  def initialize(name, **args)
    @name = name
    @partial_path = "ui_components/#{name}s/preview"
    @description = args[:description]
    @header_text = args[:header_text]
    @allow_og_pos = args[:allow_og_pos] || false
  end

  def source_code_content
    render(partial:"ui_components/#{name}s/preview", 
      locals: { source_code_render: true }).to_str
  end

  def header
    if header_text.present?
      header_text
    else
      "#{pretty_name} Components"
    end
  end

  def pretty_name
    name.split("_").join(" ").capitalize
  end
end
