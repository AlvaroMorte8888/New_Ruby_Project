require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

    test "valid signup information" do 
        get signup_path
        assert_difference 'User.count', 1 do
            post_via_redirect users_path, user: { name: "Example User",email: "user@example.com", password: "123456", password_confirmation: "123456" }
        end
        assert_template 'users/show'
        assert_select 'div#<CSS id for error explanation>' 
        assert_select 'div.<CSS class for field with error>'
    end

    test "valid signup information" do 
        get signup_path
        assert_difference 'User.count', 1 do
            post_via_redirect users_path, user: { name: "Example User", email: "user@example.com",password: "123456", password_confirmation: "123456" }
        end
        assert_template 'users/show' 
        assert_not flash.FILL_IN
    end
end