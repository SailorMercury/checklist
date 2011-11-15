class CreateListByUsers < ActiveRecord::Migration
  def change
    create_table :list_by_users do |t|

      t.timestamps
    end
  end
end
