require 'test_helper'


class SearchingProjectsByZipcodeTest < ActionDispatch::IntegrationTest

  def setup
    p = Project.first
    p.geocode
    p.save
  end

  test "searching for projects by zipcode with results" do
    visit "/projects"
    fill_in(:zipcode, :with => "75287")
    click_button "Browse"
    assert page.has_content? projects(:widows).title
  end

  test "searching for projects by zipcode without results" do
    visit "/projects"
    fill_in(:zipcode, :with => "37211")
    click_button "Browse"
    assert_not page.has_content? projects(:widows).title
  end
end
