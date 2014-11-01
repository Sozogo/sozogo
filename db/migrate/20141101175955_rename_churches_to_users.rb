class RenameChurchesToUsers < ActiveRecord::Migration
  def self.up
    rename_table :churches, :users
  end

  def self.down
    rename_table :users, :churches
  end
end
