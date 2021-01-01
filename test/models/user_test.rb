require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.new(name: "ExempleUser", email: "user@example.com")
  end   

  test "should be valid" do 
    assert @user.valid?
  end   

  test "name should be present" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end   

  test "email should be present" do
    @user.email = "a" * 255 + "@example.com"
    assert_not @user.valid?
  end 
end
