require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase

  def setup
    @volunteer = users(:volunteer)
  end

  test "should not save volunteer when first name is not provided" do
    @volunteer.first_name = ""
    assert_not @volunteer.save
  end

  test "should not save volunteer when last name is not provided" do
    @volunteer.last_name = ""
    assert_not @volunteer.save
  end

  test "should not save volunteer when city is not provided" do
    @volunteer.city = ""
    assert_not @volunteer.save
  end
end
   
