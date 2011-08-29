class Activity < ActiveRecord::Base
  validates :model_class, presence: true
  validates :model_id, presence: true
  validates :model_title, presence: true
  validates :action, presence: true

  def self.store
    Thread.current[:activity] ||= {}
  end

  def self.current_user=(user_id)
    Activity.store[:user_id] = user_id
  end

end

