require 'test_helper'

class SignupTest < ActiveSupport::TestCase

  def setup
    @signup = Signup.new(user_id: 1, project_id: 2)
  end

  test "should be valid" do
    assert @signup.valid?
  end

  test "should require a user_id" do
    @signup.user_id = nil
    assert_not @signup.valid?
  end

  test "should require a project_id" do
    @signup.project_id = nil
    assert_not @signup.valid?
  end

end
