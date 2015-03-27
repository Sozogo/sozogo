class ProjectsControllerTest < ActionController::TestCase
  test "should create project" do
    session[:user_id] = users(:cbc).id
    assert_difference('Project.count') do
      post :create, project: { :title => "Help widows in need", :description => "Come on out to Fenton and help widows in need. Pizza will be provided", :month => "01", :day => "01", :year => "2020", :address => "814 Northoak Drive", :city => "Nashville", :state => "TN", :zipcode => "37211" }
    end
    assert_redirected_to "/projects/#{Project.last.id}"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get show" do
    project = projects(:widows)
    get :show, { 'id' => project.id }
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test "should not get new if not signed in" do
    get :new
    assert_response :redirect
  end

  test "should update project" do
    project = projects(:widows)
    session[:user_id] = projects(:widows).user.id
    patch :update, { id: project.id, project: { title: "New project bro"} }
    assert_redirected_to project_path(assigns(:project))
    assert_equal "You successfully updated your project!", flash[:notice]
  end

  test "should not update project when attirbutes are dirty" do
    project = projects(:widows)
    session[:user_id] = projects(:widows).user.id
    title = "a" * 61
    patch :update, { id: project.id, project: { title: title } }
    assert_redirected_to project_path(assigns(:project))
    assert_equal "Hmm. Something went wrong. Your project was not updated.", flash[:notice]
  end

  test "should get new if signed in" do
    get(:new, {}, {'user_id' => '1' })
    assert_response :success
  end
end
