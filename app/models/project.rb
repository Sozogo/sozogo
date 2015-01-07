class Project < ActiveRecord::Base
  attr_accessor :month, :day, :year, :recurring_rules_attribute

  validates_presence_of :title
  validates :title, length: { maximum: 60 }
  validates_presence_of :description, :title, :project_address
  validate :validate_created_at
  validate :validate_user_organization
  validates :number_of_volunteers_needed, numericality: { only_integer: true, allow_nil: true }
  serialize :recurring_rules, IceCube::Schedule

  has_and_belongs_to_many :project_attributes, join_table: "projects_project_attributes"
  has_and_belongs_to_many :professions
  belongs_to :focus
  belongs_to :user

  def save_start_date(params)
    self.start_date = DateTime.civil(params["project"]["year"].to_i, params["project"]["month"].to_i, params["project"]["day"].to_i)
  end

  def save_schedule(rule_hash)
    if rule_hash
      rule = RecurringSelect.dirty_hash_to_rule(rule_hash)
      schedule = IceCube::Schedule.new
      schedule.add_recurrence_rule rule
      self.recurring_rules = schedule
    end
  end

  def display_duration
    start_time = self.start_time.strftime("%I:%M %p")
    end_time   = self.end_time.strftime("%I:%M %p")
    if start_time == end_time
      return start_time
    else
      return start_time + "-" + end_time
    end
  end

  private
  def convert_created_at
    begin
      self.start_date = DateTime.civil(self.year.to_i, self.month.to_i, self.day.to_i)
      self.start_date.to_time + 1.day >= Time.now.midnight
    rescue ArgumentError
      false
    end
  end


  def validate_created_at
    errors.add("Created at date", "is invalid.") unless convert_created_at
  end

  def validate_user_organization
    errors.add("User", " must be signed up as an organization to create a new project.") unless self.user.type == "Organization"
  end
end
