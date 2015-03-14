require 'test_helper'

class SignupVolunteerTest < ActionDispatch::IntegrationTest

  test "Sign up as volunteer" do
    visit "/signup"
    assert page.has_content? I18n.t('am_a_volunteer')
    click_link(I18n.t('am_a_volunteer'))

    assert_equal(I18n.t('create_volunteer'), find(:css, 'input#new-user-submit').value)

    # fill out volunteer form
    fill_in('volunteer_first_name', :with => "Joel")
    fill_in('volunteer_last_name', :with => "Brewer")
    fill_in('volunteer_city', :with => "Nashville")
    fill_in('volunteer_email', :with => "jb@brewerdigital.com")
    fill_in('volunteer_zipcode', :with => "37211")
    select('Tennessee', :from => 'volunteer_state')
    select('01', :from => 'volunteer_birth_day')
    select('01', :from => 'volunteer_birth_month')
    select('1991', :from => 'volunteer_birth_year')
    select(focuses(:community).name)
    select(professions(:agriculture).name)
    fill_in('volunteer_password', :with => 'helloworld')
    fill_in('volunteer_password_confirmation', :with => 'helloworld')

    assert_difference 'Volunteer.count', 1 do
      click_button('Signup')
    end
  end

end
