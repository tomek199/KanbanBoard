class Task < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :list
  belongs_to :user
end
