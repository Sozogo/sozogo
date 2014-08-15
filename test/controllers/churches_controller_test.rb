class ChurchesControllerTest < ActionController::TestCase
  test "should create church" do
    assert_difference('Church.count') do
      post :create, church: { :email => "joel@brewerdigital", :password => "helloworld" }
    end
    assert_redirected_to "/"
  end
end
