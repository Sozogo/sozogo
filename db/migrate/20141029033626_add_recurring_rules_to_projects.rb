class AddRecurringRulesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :recurring_rules, :text
  end
end
