class Hashcard < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  accepts_nested_attributes_for :tasks, :allow_destroy => true
  
  
  def answered?(answering_user)
    tasks.each do |t|
      return true if !Answer.where({:task_id => t.id, :user_id=>answering_user.id }).empty?
    end
    return false
  end
end
