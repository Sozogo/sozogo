class Project < ActiveRecord::Base
  validates_presence_of :title
  validates :title, length: { maximum: 60 }
  validates_presence_of :description
end
