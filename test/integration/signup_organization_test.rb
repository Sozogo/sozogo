require 'test_helper'

class SignupOrganizationTest < ActionDispatch::IntegrationTest

  test "Sign up as organization" do
    visit "/signup"
    assert page.has_content? I18n.t('am_an_organization')
    click_link(I18n.t('am_an_organization'))

    assert_equal(I18n.t('create_organization'), find(:css, 'input#new-user-submit').value)
  end

end
