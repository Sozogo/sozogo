require 'test_helper'

class ChurchLogsInTest < ActionDispatch::IntegrationTest
  test "church login" do
    get "/new-session"
    assert_response :success

    post_via_redirect "/create-session", email: users(:cbc).email, password: "helloworld"
    assert_equal "/", path
  end
end
