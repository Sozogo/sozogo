class AddProfessionAssociationToProject < ActiveRecord::Migration
  def self.up
    create_table :professions_projects, :id => false do |t|
      t.integer :profession_id
      t.integer :project_id
    end
  end

  def self.down
    drop_table :professions_projects
  end
end
