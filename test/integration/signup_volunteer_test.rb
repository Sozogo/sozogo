require 'test_helper'

class SignupVolunteerTest < ActionDispatch::IntegrationTest

  test "Sign up as volunteer" do
    visit "/signup"
    assert page.has_content? I18n.t('am_a_volunteer')
    click_link(I18n.t('am_a_volunteer'))

    assert_equal(I18n.t('create_volunteer'), find(:css, 'input#new-user-submit').value)
  end

end
