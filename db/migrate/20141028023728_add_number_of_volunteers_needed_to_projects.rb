class AddNumberOfVolunteersNeededToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :number_of_volunteers_needed, :integer
  end
end
