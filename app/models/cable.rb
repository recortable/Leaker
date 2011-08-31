# encoding: utf-8

class Cable < ActiveRecord::Base
  attr_reader :translated_body, :translated_subject

  belongs_to :user
  has_one :translation, dependent: :destroy

  validates :subject, presence: true
  validates :body, presence: true
  validates :translated_subject, presence:  true
  validates :translated_body, presence: true

  after_create :create_translation

  def self.get(identifier)
    Cable.find_by_identifier(identifier)
  end

  def self.get!(identifier)
    Cable.find_by_identifier!(identifier)
  end

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
    original = body.split('¶')
    translated = translation.body.split('¶')
    combined = original.zip(translated)
    id = 0
    combined.each do |o, t|
      @paragraphs << Paragraph.new(id: id,
        cable: self, translation: translation,
        original: o, translated: t)
      id += 1
    end
    @paragraphs
  end

  def paragraph(id)
    id = id.to_i
    id < paragraphs.size ? paragraphs[id] : nil
  end

  def audit(model_class, params = {})
    defaults = {model_class: model_class, action: 'update',
      identifier: self.identifier, user_id: Thread.current[:user_id]}
    Activity.create(defaults.update(params))
  end

  protected
  def create_translation
    if translated_subject.present? and translated_body.present?
      Translation.create(cable: self, subject: translated_subject,
        body: translated_body, lang: 'es-es')
    end
  end
end

