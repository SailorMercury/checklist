class User < ActiveRecord::Base

  has_many :hashcards
  has_many :answers
  has_many :tasks, :through => :answers
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end

end
