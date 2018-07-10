require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
        user: {
            name: "",
            email: "foo@bar.com",
            password: "foo",
            password_confirmaiton: "bar"
        }
    }
    assert_template 'users/edit'
  end
end
