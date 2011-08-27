module ParagraphsHelper
  def pformat(body)
    raw body.gsub(/\n/, '<br>')
  end
end

