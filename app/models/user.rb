class User < ActiveRecord::Base

  validates :name, :presence => true

  def admin?
    @is_admin ||= (self.id == 1 || self.rol == 'admin')
  end

  def self.find_by_auth(auth)
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    user ||= User.create_by_auth(auth)
  end

  def self.create_by_auth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.twitter = auth["user_info"]["nickname"]
    end
  end
end

