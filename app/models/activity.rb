class Activity < ActiveRecord::Base
  validates :model_class, presence: true
  validates :identifier, presence: true
  validates :action, presence: true

  default_scope order: 'id DESC'

  belongs_to :user

  def cable
    @cable ||= Cable.get! self.identifier
  end
end

