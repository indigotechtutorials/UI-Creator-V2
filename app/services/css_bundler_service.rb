require "fileutils"

class CssBundlerService
  attr_reader :color_scheme, :tmp_file_path, :uniq_id
  def initialize(color_scheme)
    @color_scheme = color_scheme
    @uniq_id = SecureRandom.uuid
  end

  def call
    FileUtils.rm_rf("tmp/output_css")
    @tmp_dir = FileUtils.mkdir_p("tmp/output_css")
    @tmp_file_path = "tmp/output_css/output_css_file_#{uniq_id}.css"
    @css_file_paths = Dir.glob("app/assets/stylesheets/component-styles/*")
    File.open(@tmp_file_path, "w") do |f|
      @css_file_paths.each do |file_path|
        f.write "#{File.read(file_path)}\n"
      end
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
    end
  end
end