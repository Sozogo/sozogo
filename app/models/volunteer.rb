class Volunteer < User
  validates_presence_of :first_name, :last_name, :city
end
