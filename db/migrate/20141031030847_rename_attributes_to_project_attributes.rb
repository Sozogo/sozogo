class RenameAttributesToProjectAttributes < ActiveRecord::Migration
  def self.up
    rename_table :attributes, :project_attributes
  end

  def self.down
    rename_table :project_attributes, :attributes
  end
end
