require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase

  def setup
    @organization = users(:cbc)
    @organization.password = "helloworld"
  end

  test "should save organization" do
    assert @organization.save
  end

  test "should not save organization when organization name is not provided" do
    @organization.organization_name = ""
    assert_not @organization.save
  end

  test "should not save organization when organization type is not provided" do
    @organization.organization_type = ""
    assert_not @organization.save
  end

  test "should not save organization when address is not provided" do
    @organization.address = ""
    assert_not @organization.save
  end
end
   
