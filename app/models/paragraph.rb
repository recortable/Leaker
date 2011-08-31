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
    before_body = self.translated
    self.translated = params[:translated]
    array = cable.paragraphs.collect {|p| p.translated}
    new_body = array.join(SEPARATOR)

    Cable.transaction do
      cable.translation.update_attribute(:body, new_body)
      cable.audit('Paragraph',
        {model_id: self.id, backup: before_body})
    end
  end

  def persisted?
    true
  end
end

