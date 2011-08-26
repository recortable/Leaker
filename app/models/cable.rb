class Cable < ActiveRecord::Base
  attr_reader :translated_body, :translated_subject

  belongs_to :user
  has_one :translation

  def translated_body=(body)
  end

  def translated_subject=(subject)
  end
end

