class AddProfessionIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profession_id, :integer
  end
end
