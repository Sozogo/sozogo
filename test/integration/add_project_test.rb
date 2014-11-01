require 'test_helper'

class AddProjectTest < ActionDispatch::IntegrationTest
  test "adding a project" do

    #login as church
    visit "/new-session"
    fill_in "email", with: churches(:cbc).email
    fill_in "password", with: "helloworld"
    click_on "Log in"

    assert page.has_content? "Log Out"

    #create project
    project = Project.new(:title => 'New project', :description => 'New project description')
    visit "/projects/new"
    fill_in('Title', :with => project.title)
    fill_in('Description', :with => project.description)
    select('01', :from => 'project_month')
    select('01', :from => 'project_day')
    select('2019', :from => 'project_year')
    check(project_attributes(:youth_involved).name)
    select('Community', :from => 'project_focus_id')
    check(professions(:agriculture).name)

    assert_difference 'Project.count', 1 do
      click_button('Create Project')
    end

    assert_equal "Youth involved", Project.last.project_attributes.first.name
    assert_equal "Community", Project.last.focus.name
    assert_equal "Agriculture, food and natural resources", Project.last.professions.first.name

    #visit project index
    visit "/projects"
    assert page.has_content? project.title

    #vist project show
    visit "/projects/#{Project.last.id}"
    assert page.has_content? project.description
  end
end
