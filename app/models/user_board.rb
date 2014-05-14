class UserBoard < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  
  def UserBoard.owner?(user, board)
    user_board = UserBoard.select(:owner).where(user: user, board: board).take
    user_board.owner
  end
end
