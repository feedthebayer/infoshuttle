# require 'redcarpet'

module ApplicationHelper
  def markdown_to_html(markdown)
    extensions = {
      no_intra_emphasis: true,
      autolink: true
    }
    redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)
    (redcarpet.render markdown).html_safe
  end
end
