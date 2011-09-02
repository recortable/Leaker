# encoding: utf-8

class Cable < ActiveRecord::Base
  after_create :create_translation
  after_create :audit_creation

  belongs_to :user
  has_one :translation, dependent: :destroy
  #has_many :comments, foreign_key: :identifier

  attr_accessor :translated_body, :translated_subject
  validates :subject, presence: true
  validates :body, presence: true
  validates :translated_subject, presence:  true
  validates :translated_body, presence: true

  def comments
    @comments ||= Comment.where(identifier: self.identifier)
  end

  def self.get(identifier)
    Cable.find_by_identifier(identifier)
  end

  def self.get!(identifier)
    Cable.find_by_identifier!(identifier)
  end

  # Use 'identifier' as id in the url
  def to_param
    identifier
  end

  def paragraphs
    @paragraphs ||= build_paragraphs
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

  # lazy load comments: not always needed
  def load_comments
    paragraphs.each {|p| p.comments = []}
    comments = self.comments
    comments.each do |c|
      p = paragraph(c.paragraph_id)
      p.comments << c
    end
  end

  protected
  def audit_creation
    audit('Cable', {action: 'create'})
  end

  def build_paragraphs
    paragraphs = []
    original = body.split('¶')
    translated = translation.body.split('¶')
    combined = original.zip(translated)
    id = 0
    combined.each do |o, t|
      paragraphs << Paragraph.new(id: id,
        cable: self, translation: translation,
        original: o, translated: t)
      id += 1
    end
    paragraphs
  end

  def create_translation
    if translated_subject.present? and translated_body.present?
      Translation.create(cable: self, subject: translated_subject,
        body: translated_body, lang: 'es-es')
    end
  end
end

