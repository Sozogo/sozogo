module ApplicationHelper
  def months_array
    ('01'..'12').to_a
  end

  def days_array
    ('01'..'31').to_a
  end

  def next_n_years_array(n)
    ((Time.now.year)..Time.now.year + n).to_a
  end

  def previous_hundred_years
    ((Time.now.year - 100)..Time.now.year).to_a.reverse
  end

  def user_signup_message
    type = params["type"].downcase
    translation = "create_" + type
    I18n.t(translation)
  end

  def flash_class(level)
    case level
    when :notice then "flash flash-notice"
    when :success then "flash flash-success"
    when :error then "flash flash-error"
    when :alert then "flash flash-alert"
    end
  end
end
