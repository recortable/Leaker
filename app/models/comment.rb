class Comment < ActiveRecord::Base
  belongs_to :user
  after_create :audit

  default_scope order: 'id DESC'

  validates :identifier, presence: true
  validates :paragraph_id, presence: true
  validates :body, presence: true


  def cable
    @cable ||= Cable.get! self.identifier
  end

  protected
  def audit
    cable.audit('Comment', model_id: self.id, action: 'create')
  end
end

