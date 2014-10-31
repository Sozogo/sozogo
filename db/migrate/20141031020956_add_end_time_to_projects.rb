class AddEndTimeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :end_time, :time
  end
end
