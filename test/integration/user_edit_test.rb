require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "fooooo"
    email = "foo@bar.com"
    patch user_path(@user), params: {
        user: {
            name: name,
            email: email,
            password: "",
            password_confirmaiton: ""
        }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email

  end
end
