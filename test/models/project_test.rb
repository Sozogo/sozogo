require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = projects(:widows)
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

  test "should not create project in the past" do
    @project.start_date = "2010-10-10"
    assert_not @project.save
  end
end
