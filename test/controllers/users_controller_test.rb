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

  test "should create organization" do
    organization = users(:cbc)
    assert_difference('User.count') do
      post :create, organization: { email: organization.email, password: "helloworld", organization_type: organization.organization_type, organization_name: organization.organization_name, organization_contact_name: organization.organization_contact_name, address: organization.address, statement_of_beliefs: true }, "type" => "Organization"
    end
  end

  test "should not create organization if terms are not accepted" do
    organization = users(:cbc)
    assert_no_difference('User.count') do
      post :create, organization: { email: organization.email, organization_type: organization.type, organization_name: organization.organization_name, organization_contact_name: organization.organization_contact_name, address: organization.address }, "type" => "Organization"
    end
  end
end
