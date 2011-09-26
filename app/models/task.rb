class Task < ActiveRecord::Base
  belongs_to :hashcard
  has_many :answers
  has_many :users, :through => :answers
end
