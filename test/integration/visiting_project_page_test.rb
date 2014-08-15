require 'test_helper'

class VisitingProjectPagesTest < ActionDispatch::IntegrationTest

  test "visiting projects page" do
    visit "/projects"
    assert page.has_content? projects(:widows).title
  end

  test "visiting project detail page" do
    visit "/projects/#{projects(:widows).id}"
    assert page.has_content? projects(:widows).description
  end

end
