require 'rake'

namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:drop, :create, :migrate, :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    10.times { User.create!( email: Faker::Internet.email, password: Faker::Internet.password, type: "Organization", organization_type: "Church", organization_name: Faker::Company.name, organization_contact_name: Faker::Name.name, address: Faker::Address.street_address, city: Faker::Address.city) }
    10.times { 
      start_date = Faker::Date.forward.to_s.split("-")
      year = start_date[0].to_i
      month = start_date[1].to_i
      day = start_date[2].to_i

      Project.create!( title: Faker::Lorem.words(4).join(" ").capitalize, description: Faker::Lorem.paragraph(2), number_of_volunteers_needed: rand(1..100), year: year, month: month, day: day, start_time: Time.now + 1.day, end_time: Time.now + 1.day + 1.hour, user_id: User.order("RANDOM()").where(:type => "Organization").first.id)  }
  end
end
