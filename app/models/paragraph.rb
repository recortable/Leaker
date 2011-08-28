# encoding: utf-8

class Paragraph
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  SEPARATOR = '¶'

  attr_accessor :id
  attr_accessor :cable, :translation
  attr_accessor :position, :original, :translated

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def update(params)
    self.translated = params[:translated]
    array = cable.paragraphs.collect {|p| p.translated}
    new_body = array.join(SEPARATOR)
    cable.translation.update_attribute(:body, new_body)
  end

  def persisted?
    true
  end
end

