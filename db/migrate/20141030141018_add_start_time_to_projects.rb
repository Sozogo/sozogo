class AddStartTimeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :start_time, :time
  end
end
