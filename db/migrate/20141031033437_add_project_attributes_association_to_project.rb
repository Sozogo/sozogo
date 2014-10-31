class AddProjectAttributesAssociationToProject < ActiveRecord::Migration
  def self.up
    create_table :projects_project_attributes, :id => false do |t|
      t.integer :project_id
      t.integer :project_attribute_id
    end
  end

  def self.down
    drop_table :projects_project_attributes
  end
end
