class AddOrganizationContactNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :organization_contact_name, :string
  end
end
