class Activity < ActiveRecord::Base
  validates :model_class, presence: true
  validates :identifier, presence: true
  validates :action, presence: true

  default_scope order: 'id DESC'

  def cable
    @cable ||= Cable.get! self.identifier
  end

  def user
    @user ||= User.find user_id if user_id.present?
  end
end

