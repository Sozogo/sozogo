class RenameFocusToFocuses < ActiveRecord::Migration
  def self.up
    rename_table :focus, :focuses
  end

  def self.down
    rename_table :focuses, :focus
  end
end
