class AddVolunteerInstructionsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :volunteer_instructions, :text
  end
end
