require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  test "should not create project when title is not provided" do
    project = Project.new(:description => "come help widows!")
    assert_not project.save
  end

  test "should not create project when description is not provided" do
    project = Project.new(:title => "Widows in need")
    assert_not project.save
  end

  test "should not create project when title is > 60 characters" do
    long_title = "a" * 61
    project = Project.new(:description => "come help!", :title => long_title)
    assert_not project.save
  end
end
