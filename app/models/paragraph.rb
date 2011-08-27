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
    self.translation = params[:translation]
    body = cable.paragraphs.map {|t| t.translation}.join(SEPARATOR)
    cable.translation.update_attribute(:body, body)
  end

  def persisted?
    false
  end
end

