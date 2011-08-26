class Cable < ActiveRecord::Base
  attr_reader :translated_body, :translated_subject

  belongs_to :user
  has_one :translation

  validates :subject, :presence => true
  validates :body, :presence => true
  validates :translated_subject, :presence => true
  validates :translated_body, :presence => true

  def translated_body=(body)
  end

  def translated_subject=(subject)
  end
end

