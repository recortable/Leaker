class Cable < ActiveRecord::Base
  belongs_to :user
  has_one :translation
end

