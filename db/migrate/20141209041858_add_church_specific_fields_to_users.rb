class AddChurchSpecificFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :denomination, :string
    add_column :users, :pastor, :string
    add_column :users, :service_times, :text
    add_column :users, :congregation_size, :string
    add_column :users, :church_statement, :text
  end
end
