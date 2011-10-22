class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  
  scope :for_user, lambda { |user| {:conditions => {user_id: user.id}}}
end
