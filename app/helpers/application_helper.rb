module ApplicationHelper
  def inline_svg(filename, options = {})
    file_path = Rails.root.join("app", "assets", "images", filename)
    return "(SVG not found)" unless File.exist?(file_path)

    file = File.read(file_path)
    doc = Nokogiri::HTML::DocumentFragment.parse(file)
    svg = doc.at_css("svg")

    options.each do |attr, value|
      svg[attr.to_s] = value
    end

    doc.to_html.html_safe
  end
end
