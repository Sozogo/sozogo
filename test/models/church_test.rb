require 'test_helper'

class ChurchTest < ActiveSupport::TestCase

  test "should not save church when email is not provied" do
    church = Church.new
    assert_not church.save
  end

  test "should create password_salt before save" do
    church = Church.new
    church.save
    assert_not_equal church.password_salt, nil, "Password salt is nil"
  end

  test "should create password_hash before save" do
    church = Church.new
    church.save
    assert_not_equal church.password_hash, nil, "Password hash is nil"
  end

  test "should return church when correct email and password are provided" do
    church = Church.new(:email => "joel@brewerdigital.com", :password => "helloworld")
    church.save
    assert_equal Church.authenticate("joel@brewerdigital.com", "helloworld"), church

  end

  test "should not return church when incorrect email and password are provided" do
    church = Church.new(:email => "joel@brewerdigital.com", :password => "helloworld")
    church.save
    assert_not_equal Church.authenticate("joel@brewerdigital.com", "goodbyeworld"), church
  end
end
