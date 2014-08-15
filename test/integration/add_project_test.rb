require 'test_helper'

class AddProjectTest < ActionDispatch::IntegrationTest
  test "adding a project" do

    #login as church
    get "/new-session"
    post_via_redirect "/create-session", email: churches(:cbc).email, password: "helloworld"

    #create project
    project = Project.new(:title => 'New project', :description => 'New project description')
    visit "/projects/new"
    fill_in('Title', :with => project.title)
    fill_in('Description', :with => project.description)
    click_button('Create Project')
    assert_equal "/", path

    #visit project index
    visit "/projects"
    assert page.has_content? project.title

    #vist project show
    visit "/projects/#{Project.last.id}"
    assert page.has_content? project.description
  end
end
