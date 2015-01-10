class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :signups, :user_id
    add_index :signups, :project_id
  end
end
