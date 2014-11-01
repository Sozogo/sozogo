require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user when email is not provied" do
    user = User.new
    assert_not user.save
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
