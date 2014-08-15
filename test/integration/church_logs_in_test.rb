require 'test_helper'

class ChurchLogsInTest < ActionDispatch::IntegrationTest
  test "login and browse site" do
    get "/new-session"
    assert_response :success

    post_via_redirect "/create-session", email: churches(:cbc).email, password: "helloworld"
    assert_equal "/", path
  end
end
