class CreateHashcards < ActiveRecord::Migration
  def change
    create_table :hashcards do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
