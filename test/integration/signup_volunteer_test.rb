require 'test_helper'

class SignupVolunteerTest < ActionDispatch::IntegrationTest

  test "Sign up as volunteer" do
    visit "/signup"
    assert page.has_content? I18n.t('am_a_volunteer')
    click_link(I18n.t('am_a_volunteer'))

    assert_equal(I18n.t('create_volunteer'), find(:css, 'input#new-user-submit').value)

    # fill out volunteer form
    volunteer = users(:volunteer)
    fill_in('First name', :with => volunteer.first_name)
    fill_in('Last name', :with => volunteer.last_name)
    fill_in('City', :with => volunteer.city)
    fill_in('Email', :with => volunteer.email)
    select(focuses(:community).name)
    select(professions(:agriculture).name)
    fill_in('Password', :with => 'helloworld')
    fill_in('Password confirmation', :with => 'helloworld')

    assert_difference 'Volunteer.count', 1 do
      click_button('Signup')
    end
  end

end
