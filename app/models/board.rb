class Board < ActiveRecord::Base
  validates_presence_of :name
  has_many :user_boards, dependent: :delete_all
  has_many :users, through: :user_boards
  has_many :lists
  
  def Board.get_user_boards(user, owner = 0)
    Board.joins(:user_boards).where(user_boards: {user: user, owner: owner})
  end
end
