class AddPermalinkToHashcard < ActiveRecord::Migration
  def self.up
    add_column :hashcards, :permalink, :string
    add_index :hashcards, :permalink
  end
  def self.down
    remove_column :hashcards, :permalink
  end
end