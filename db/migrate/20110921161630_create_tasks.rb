class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :hashcard_id

      t.timestamps
    end
  end
end
