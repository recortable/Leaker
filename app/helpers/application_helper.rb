module ApplicationHelper

  def title(text, tag = :h1)
    content_for(:title) {text}
    content_tag tag, text
  end

  def markdown(text)
    if text.present?
      # :hard_wrap,:fenced_code, :gh_blockcode
      options = [:filter_html, :autolink, :no_intraemphasis]
      text.gsub!(/^\s*#/, '##')
      Redcarpet.new(text, *options).to_html.html_safe
    end
  end

  def simple_anti_spam
    text_field_tag :email, '', class: 'required'
  end

end

