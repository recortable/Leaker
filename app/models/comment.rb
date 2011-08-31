# A comment, always associated to a paragraph (paragraph_id)
# of a cable (cable_id). User is optional

class Comment < ActiveRecord::Base
  belongs_to :user
  after_create :audit_create

  default_scope order: 'id DESC'

  validates :identifier, presence: true
  validates :paragraph_id, presence: true
  validates :body, presence: true

  def cable
    @cable ||= Cable.get! self.identifier
  end

  protected
  def audit_create
    cable.audit('Comment', model_id: self.id, action: 'create')
  end
end

