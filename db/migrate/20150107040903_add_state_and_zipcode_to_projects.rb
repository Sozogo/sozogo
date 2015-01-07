class AddStateAndZipcodeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :state, :string
    add_column :projects, :zipcode, :string
  end
end
