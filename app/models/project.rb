class Project < ActiveRecord::Base
  attr_accessor :month, :day, :year, :hour, :minute, :ampm

  validates_presence_of :title
  validates :title, length: { maximum: 60 }
  validates_presence_of :description
  validate :validate_created_at
  validates :number_of_volunteers_needed, numericality: { only_integer: true, allow_nil: true }

  private
  def convert_created_at
    begin
      self.start_date = DateTime.civil(self.year.to_i, self.month.to_i, self.day.to_i)
      self.start_date.to_time >= Time.now
    rescue ArgumentError
      false
    end
  end

  def validate_created_at
    errors.add("Created at date", "is invalid.") unless convert_created_at
  end
    
end
