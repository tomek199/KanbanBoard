class List < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :board
  
  def List.get_max_order(board_id)
    order = List.where(board_id: board_id).maximum(:order)
    return 1 if order == nil
    order+=1
  end
end
