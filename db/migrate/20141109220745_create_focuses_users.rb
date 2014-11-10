class CreateFocusesUsers < ActiveRecord::Migration
  def self.up
    create_table :focuses_users, :id => false do |t|
      t.integer :focus_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :focuses_users
  end
end
