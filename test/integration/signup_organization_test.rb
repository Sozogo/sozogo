require 'test_helper'

class SignupOrganizationTest < ActionDispatch::IntegrationTest

  test "Sign up as organization" do
    visit "/signup"
    assert page.has_content? I18n.t('am_an_organization')
    click_link(I18n.t('am_an_organization'))

    assert_equal(I18n.t('create_organization'), find(:css, 'input#new-user-submit').value)

    # fill out volunteer form
    organization = users(:cbc)
    select('Church')
    fill_in('Organization name', :with => organization.organization_name)
    fill_in('Phone number', :with => organization.phone_number)
    fill_in('Organization contact name', :with => organization.organization_contact_name)
    fill_in('Address', :with => organization.address)
    fill_in('Email', :with => organization.email)
    check(focuses(:community).name)
    fill_in('Password', :with => 'helloworld')
    fill_in('Password confirmation', :with => 'helloworld')
    find(:css, "#organization_statement_of_beliefs").set(true)


    assert_difference 'Organization.count', 1 do
      click_button('Create organization')
    end

    @organization = Organization.last

    assert_equal "Community", @organization.focuses.first.name
  end

end
