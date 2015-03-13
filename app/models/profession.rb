class Profession < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_many :users
end
