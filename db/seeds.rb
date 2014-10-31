# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
project_attributes = [
  "Youth involved",
  "Physically strenuous",
  "Handicap friendly",
  "Age limit",
  "Daycare available",
  "Lunch provided",
  "Indoor",
  "Outdoor",
  "Training",
  "Free parking",
  "Virtual"
]

project_attributes.each do |name|
  ProjectAttribute.create(name: name)
end

foci = [
  "Advocacy and human rights",
  "Animals",
  "Art and culture",
  "Children and youth",
  "Community",
  "Computers and technology",
  "Crisis support",
  "Disabled",
  "Disaster relief",
  "Education and literacy",
  "Emergency and safety",
  "Employment",
  "Environment",
  "Evangelism",
  "Health and medicine",
  "Homeless and housing",
  "Hunger",
  "Immigrants and refugees",
  "Justice and legal",
  "Media and broadcasting",
  "Politics",
  "Race and ethnicity",
  "Seniors",
  "Sports and recreation",
  "Veterans and military families",
  "Women"
]

foci.each do |name|
  Focus.create(name: name)
end

professions = [
  "Agriculture, food and natural resources",
  "Arts, audio/video technology and communications",
  "Architecture and construction",
  "Business management and administration",
  "Education and training",
  "Finance",
  "Government and public administration",
  "Health science",
  "Hospitality and tourism",
  "Human services",
  "Information technology",
  "Law, public safety, corrections and security",
  "Manufacturing",
  "Marketing, sales and service",
  "Science, technology, engineering and mathematics",
  "Transportation, distribution and logistics"
]

professions.each do |name|
  Profession.create(name: name)
end
