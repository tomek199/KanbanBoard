class Board < ActiveRecord::Base
  validates_presence_of :name
  has_many :users, through: :user_has_boards
end
