module ApplicationHelper

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language)
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(:safe_links_only => true),
      :fenced_code_blocks => true, :autolink => true
    )
    markdown.render(text || '').html_safe
  end

end
