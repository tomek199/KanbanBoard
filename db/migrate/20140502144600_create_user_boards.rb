class CreateUserBoards < ActiveRecord::Migration
  def change
    create_table :user_boards do |t|
      t.references :user, index: true
      t.references :board, index: true
      t.integer :owner

      t.timestamps
    end
  end
end
