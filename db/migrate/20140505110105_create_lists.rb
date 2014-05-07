class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :order
      t.references :board, index: true

      t.timestamps
    end
  end
end
