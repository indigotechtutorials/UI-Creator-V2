class BundleCssController < ApplicationController
  def show
    # TODO: Bundle this CSS
    # "assets/stylesheets/component-styles/*"
    # Need to merge all CSS files into one and then add CSS variables at end
    @css_bundler = CssBundlerService.new(@color_scheme)
    @css_bundler.call
  end

  def download
    filepath = Rails.root.join("tmp/output_css/output_css_file_#{params[:uniq_id]}.css")
    stat = File::stat(filepath)
    send_file(filepath, filename: "ui-library.css", length: stat.size)
  end
end