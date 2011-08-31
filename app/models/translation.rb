class Translation < ActiveRecord::Base
  belongs_to :cable
  belongs_to :user

  validates :cable_id, :presence => true
  validates :subject, :presence => true
  validates :body, :presence => true
  validates :lang, :presence => true

  def update_summary(summary)
    original_summary = self.summary
    Cable.transaction do
      self.update_attribute(:summary, summary)
      self.cable.audit('Summary',
        {backup: original_summary})
    end
  end
end

