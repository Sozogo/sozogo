require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = projects(:widows)
    @project.year = 2018
    @project.month = 01
    @project.day = 01
  end

  test "should be valid when all attributes are provided" do
    assert @project.valid?
  end
  
  test "should not create project when title is not provided" do
    @project.title = nil
    assert_not @project.save
  end

  test "should not create project when description is not provided" do
    @project.description = nil
    assert_not @project.save
  end

  test "should not create project when title is > 60 characters" do
    @project.title = "a" * 61
    assert_not @project.save
  end

  test "should not create project when number_of_volunteers_needed is not an integer" do
    @project.number_of_volunteers_needed = "ten"
    assert_not @project.save
  end

  test "#future should not return projects in the past" do
    p = Project.first
    a_long_time_ago = p.start_date - 50.years
    p.update_attribute('start_date', a_long_time_ago)

    future_projects = Project.future
    assert_equal false, future_projects.include?(p)
  end

  test "#near should return nearby projects" do
    p = Project.first
    p.geocode
    p.save!
    
    zipcode = "75287"
    radius = "10"
    p = Project.near(zipcode, radius)

    assert_equal 1, p.length
  end

  test "#near should not return far away projects" do
    p = Project.first
    p.geocode
    p.save!

    zipcode = "37211"
    radius = "10"
    p = Project.near(zipcode, radius)
    
    assert_equal 0, p.length
  end
end
