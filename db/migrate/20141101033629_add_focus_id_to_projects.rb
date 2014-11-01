class AddFocusIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :focus_id, :integer
  end
end
