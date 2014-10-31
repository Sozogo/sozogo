class ProjectAttribute < ActiveRecord::Base
  has_and_belongs_to_many :projects, join_table: "projects_project_attributes"
end
