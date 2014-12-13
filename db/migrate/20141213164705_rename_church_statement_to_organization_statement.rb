class RenameChurchStatementToOrganizationStatement < ActiveRecord::Migration
  def change
    rename_column :users, :church_statement, :organization_statement
  end
end
