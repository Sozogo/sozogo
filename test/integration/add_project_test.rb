require 'test_helper'

class AddProjectTest < ActionDispatch::IntegrationTest
  test "adding a project" do

    #login
    visit "/new-session"
    fill_in "email", with: users(:cbc).email
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
    fill_in('Volunteer instructions', :with => 'Park across the street. Meet in the atrium.')

    assert_difference 'Project.count', 1 do
      click_button('Create Project')
    end

    assert_equal "/projects/#{Project.last.id}", current_path
    
    @project = Project.last

    assert_equal "Youth involved", @project.project_attributes.first.name
    assert_equal "Community", @project.focus.name
    assert_equal "Agriculture, food and natural resources", @project.professions.first.name
    assert_equal "Park across the street. Meet in the atrium.", @project.volunteer_instructions

    #visit project index
    visit "/projects"
    assert page.has_content? project.title

    #vist project show
    visit "/projects/#{@project.id}"
    assert page.has_content? project.description
  end
end
