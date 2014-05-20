class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :start
      t.date :end
      t.string :estimate
      t.string :created_by
      t.references :list, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
