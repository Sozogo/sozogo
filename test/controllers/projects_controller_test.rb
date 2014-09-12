class ProjectsControllerTest < ActionController::TestCase
  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { :title => "Help widows in need", :description => "Come on out to Fenton and help widows in need. Pizza will be provided", :month => "01", :day => "01", :year => "2020" }
    end
    assert_redirected_to "/"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get show" do
    project = Project.create( :title => "Help widows.", :description => "Come help widows")
    get :show, { 'id' => project.id }
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test "should not get new if not signed in" do
    get :new
    assert_response :redirect
  end

  test "should get new if signed in" do
    get(:new, {}, {'church_id' => '1' })
    assert_response :success
  end
end
