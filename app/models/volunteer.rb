class Volunteer < User
  attr_accessor :birth_month, :birth_day, :birth_year
  validates_presence_of :first_name, :last_name, :city

  def set_birthday params
    birthday = Date.parse("#{params["volunteer"]["birth_year"]}-#{params["volunteer"]["birth_month"]}-#{params["volunteer"]["birth_day"]}")
    self.birthday = birthday
  end
end
