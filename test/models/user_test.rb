require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @volunteer = users(:volunteer)
    @volunteer.password = "helloworld"
  end

  test "should be valid when all attributes are provided" do
    assert @volunteer.valid?
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

  test "should create password_salt before save" do
    user = User.new(:email => "joel@brewerdigital.com", :password => "helloworld")
    user.save
    assert_not_equal user.password_salt, nil, "Password salt is nil"
  end

  test "should create password_hash before save" do
    user = User.new(:email => "joel@brewerdigitalcom", :password => "helloworld")
    user.save
    assert_not_equal user.password_hash, nil, "Password hash is nil"
  end

  test "should return user when correct email and password are provided" do
    user = User.new(:email => "joel@brewerdigital.com", :password => "helloworld")
    user.save
    assert_equal User.authenticate("joel@brewerdigital.com", "helloworld"), user

  end

  test "should not return user when incorrect email and password are provided" do
    user = User.new(:email => "joel@brewerdigital.com", :password => "helloworld")
    user.save
    assert_not_equal User.authenticate("joel@brewerdigital.com", "goodbyeworld"), user
  end
end
