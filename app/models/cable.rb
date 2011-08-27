# encoding: utf-8

class Cable < ActiveRecord::Base
  attr_reader :translated_body, :translated_subject

  belongs_to :user
  has_one :translation

  validates :subject, :presence => true
  validates :body, :presence => true
  validates :translated_subject, :presence => true
  validates :translated_body, :presence => true

  after_create :create_translation

  def translated_body=(body)
    @translated_body = body
  end

  def translated_subject=(subject)
    @translated_subject = subject
  end

  def to_param
    identifier
  end

  def paragraphs
    return @paragraphs if @paragraphs
    @paragraphs = []
    original_sliced = body.split('¶')
    original_sliced.each do |p|
      @paragraphs << Paragraph.new(original: p)
    end
    @paragraphs
  end


  protected
  def create_translation
    if translated_subject.present? and translated_body.present?
      Translation.create(cable: self, subject: translated_subject,
        body: translated_body, lang: 'es-es')
    end
  end
end

