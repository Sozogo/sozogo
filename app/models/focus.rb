class Focus < ActiveRecord::Base
  has_many :projects
  has_and_belongs_to_many :users, join_table: "focuses_users"
end
