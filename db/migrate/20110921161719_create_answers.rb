class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :value
      t.string :column_name

      t.timestamps
    end
    
    add_index :answers, [:user_id, :task_id]
  end
end
