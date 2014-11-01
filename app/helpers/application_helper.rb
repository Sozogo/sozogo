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

  def user_signup_message
    type = params["type"].downcase
    translation = "create_" + type
    I18n.t(translation)
  end
end
