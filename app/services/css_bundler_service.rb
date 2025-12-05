require "fileutils"
require "zip"

class CssBundlerService
  attr_reader :color_scheme, :tmp_css_output_path, :tmp_js_output_path, :uniq_id
  def initialize(color_scheme)
    @color_scheme = color_scheme
    @uniq_id = SecureRandom.uuid
  end

  def call
    FileUtils.rm_rf("tmp/output_css")
    @tmp_dir = FileUtils.mkdir_p("tmp/output_css")
    create_css_file and create_js_file and bundle_zip
  end

  def create_css_file
    @tmp_css_output_path = "tmp/output_css/output_css_file_#{uniq_id}.css"
    @css_file_paths = Dir.glob("app/assets/stylesheets/component-styles/*")
    File.open(@tmp_css_output_path, "w") do |f|
      f.write """
        :root {
          /* User UI Library Color Scheme */

          --black: #{@color_scheme[:black]};
          --dark-gray: #{@color_scheme[:dark_gray]};
          --light-gray: #{@color_scheme[:light_gray]};
          --white: #{@color_scheme[:white]};
          --red: #{@color_scheme[:red]};
          --green: #{@color_scheme[:green]};
          --primary: #{@color_scheme[:primary]};
          --secondary: #{@color_scheme[:secondary]};
        }\n
      """.strip
      @css_file_paths.each do |file_path|
        f.write "#{File.read(file_path)}\n"
      end
    end
  end

  def create_js_file
    @tmp_js_output_path = "tmp/output_css/output_js_file_#{uniq_id}.js"
    File.open(@tmp_js_output_path, "w") do |f|
      f.write "#{File.read(Rails.root.join("app/javascript/ui_library.js"))}\n"
    end
  end

  def bundle_zip
    @tmp_zip_output_path = "tmp/output_css/output_zip_file_#{uniq_id}.zip"
    Zip::File.open(@tmp_zip_output_path, create: true) do |zipfile|
      zipfile.add("ui-library.css", Rails.root.join(tmp_css_output_path))
      zipfile.add("ui-library.js", Rails.root.join(tmp_js_output_path))
    end
  end
end