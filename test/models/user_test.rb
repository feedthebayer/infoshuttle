require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "default wiki created for new user" do
    new_user = User.create!(username: "test", name: "test_name")

    assert_equal new_user.owned_wikis.count, 1, "Default wiki not created"
    assert_equal new_user.owned_wikis.first.pages.count, 1, "Default page not created"
  end
end
