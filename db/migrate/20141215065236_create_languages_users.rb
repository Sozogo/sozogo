class CreateLanguagesUsers < ActiveRecord::Migration
  def self.up
    create_table :languages_users do |t|
      t.integer :language_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :languages_users
  end
end
