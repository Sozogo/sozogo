class UsersControllerTest < ActionController::TestCase
  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { :email => "joel@brewerdigital", :password => "helloworld" }
    end
    assert_redirected_to "/"
  end
end
