class Translation < ActiveRecord::Base
  belongs_to :cable
  belongs_to :user
end
