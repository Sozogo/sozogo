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
    fill_in('organization_organization_name', :with => organization.organization_name)
    fill_in('organization_phone_number', :with => organization.phone_number)
    fill_in('organization_organization_contact_name', :with => organization.organization_contact_name)
    fill_in('organization_address', :with => organization.address)
    fill_in('organization_city', :with => organization.city)
    fill_in('organization_zipcode', :with => organization.zipcode)
    fill_in('organization_email', :with => "test@organization.com")
    select('Tennessee', :from => 'organization_state')
    select(focuses(:community).name)
    fill_in('organization_password', :with => 'helloworld')
    fill_in('organization_password_confirmation', :with => 'helloworld')
    find(:css, "#organization_statement_of_beliefs").set(true)


    assert_difference 'Organization.count', 1 do
      click_button('Create organization')
    end

    @organization = Organization.last

    assert_equal "Community", @organization.focuses.first.name
  end

end
