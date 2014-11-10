class UsersControllerTest < ActionController::TestCase
  test "should create volunteer" do
    assert_difference('Volunteer.count') do
      post :create, "volunteer" => { :email => "joel@brewerdigital", :password => "helloworld", :type => "Volunteer", :city => "Nashville", :first_name => "Joel", :last_name => "Brewer" }, "type" => "Volunteer"
    end
    assert_redirected_to "/"
  end

  test "should render volunteer form if user type is volunteer" do
    get(:new, {'type' => "Volunteer"})
    assert_template %r{\Ausers/volunteers/new\Z}
  end

  test "should render organization form if user type is organization" do
    get(:new, {'type' => "Organization"})
    assert_template %r{\Ausers/organizations/new\Z}
  end
end
