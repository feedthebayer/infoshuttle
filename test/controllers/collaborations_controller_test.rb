require 'test_helper'

class CollaborationsControllerTest < ActionController::TestCase

  def setup
    @user = users(:premium_user)
    # TODO - login user
  end

  test "create new collaboration" do
    @wiki = wikis(:private_wiki1)
    assert_difference "@wiki.collaborations.count", 1,
        "collaboration not created" do
      post :create, wiki_id: @wiki.id, user_id: @user.id
    end

    assert_equal @user.id, @wiki.collaborations.first.user.id,
      "collaboration not created properly"
    # assert_redirected_to wiki_path(@wiki), "not redirected"
  end

  test "destroyed collaboration" do
    @collaboration = collaborations(:collaboration1)
    @wiki = @collaboration.wiki

    assert_difference "@wiki.collaborations.count", -1,
        "collaboration not destroyed" do
      delete :destroy, wiki_id: @wiki.id, id: @collaboration.id
    end

    # assert_redirected_to wiki_path(@wiki), "not redirected"
  end
end
