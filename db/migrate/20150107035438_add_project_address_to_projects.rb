class AddProjectAddressToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_address, :string
  end
end
