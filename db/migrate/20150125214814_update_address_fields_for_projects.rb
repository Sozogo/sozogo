class UpdateAddressFieldsForProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :project_address, :address
  end
end
