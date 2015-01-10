require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @volunteer = users(:volunteer)
    @project = projects(:widows)
    @volunteer.password = "helloworld"
  end

  test "should be valid when all attributes are provided" do
    assert @volunteer.valid?
  end

  test "should be invalid when email is not unique" do
    user2 = User.create(:email => @volunteer.email, :password => @volunteer.email)
    assert user2.invalid?
  end

  test "should be invalid when email is not provied" do
    @volunteer.email = nil
    assert @volunteer.invalid?
  end

  test "should be invalid when password is not provided" do
    @volunteer.password = nil
    assert @volunteer.invalid?
  end

  test "should be invalid when first name is not provided" do
    @volunteer.first_name = nil
    assert @volunteer.invalid?
  end

  test "should be invalid when last name is not provided" do
    @volunteer.last_name = nil
    assert @volunteer.invalid?
  end

  test "should create password_salt before save" do
    user = User.new(:zipcode => "37211", :state => "TN", :city => "Nashville", :email => "joel@brewerdigital.com", :password => "helloworld")
    user.save
    assert_not_equal user.password_salt, nil, "Password salt is nil"
  end

  test "should create password_hash before save" do
    user = User.new(:zipcode => "37211", :state => "TN", :city => "Nashville",:email => "joel@brewerdigitalcom", :password => "helloworld")
    user.save
    assert_not_equal user.password_hash, nil, "Password hash is nil"
  end

  test "should return user when correct email and password are provided" do
    user = User.new(:zipcode => "37211", :state => "TN", :city => "Nashville", :email => "joel@brewerdigital.com", :password => "helloworld")
    user.save
    assert_equal User.authenticate("joel@brewerdigital.com", "helloworld"), user

  end

  test "should not return user when incorrect email and password are provided" do
    user = User.new(:email => "joel@brewerdigital.com", :password => "helloworld")
    user.save
    assert_not_equal User.authenticate("joel@brewerdigital.com", "goodbyeworld"), user
  end

  test "should signup and cancel registration of a project" do
    assert_not @volunteer.signed_up?(@project)
    @volunteer.sign_up(@project)
    assert @volunteer.signed_up?(@project)
    @volunteer.cancel_sign_up(@project)
    assert_not @volunteer.signed_up?(@project)
  end
end
