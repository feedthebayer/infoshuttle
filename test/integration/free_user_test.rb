require 'test_helper'

class FreeUserTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:free_user)

    @public_wiki1 = wikis(:public_wiki1)
    @public_wiki2 = wikis(:public_wiki2)
    @private_wiki1 = wikis(:private_wiki1)

    @public_page1 = pages(:public_page1)
    @public_page2 = pages(:public_page2)
    @private_page1 = pages(:private_page1)

    # TODO - Login user
    raise "Sorcery doesn't support testing oauth logged_in users"
    # login_user
  end

  test "free user sees their wikis at root path" do
    visit root_path
    assert_equal user_path(@user), current_path
    # TODO
  end

  test "free user only sees correct wikis in index" do
    visit wikis_path
    assert_equal wikis_path, current_path, "at wrong path"
    assert page.has_content?(@public_wiki1.name), "public wiki missing"
    assert page.has_content?(@public_wiki2.name), "public wiki missing"
    # assert page.has_no_content?(@private_wiki1.name), "private wiki shown"
    # TODO
  end

  test "free user can view public wikis" do
    visit wiki_path(@public_wiki1)
    assert_equal wiki_path(@public_wiki1), current_path, "redirected"
    assert page.has_content?(@public_page1.title), "page not found"
  end

  test "free user cannot view private wikis" do
    visit wiki_path(@private_wiki1)
    assert_equal root_path, current_path, "not redirected"
    # TODO - support collaboration
  end

  test "free user can create public wikis and pages" do
    assert_difference "Wiki.count", 1, "wiki not created" do
      post wikis_path
    end
    # assert_redirected_to root_path, "not redirected"

    assert_difference "Page.count", 1, "page not created" do
      post wiki_pages_path(@public_wiki1)
    end
    # assert_redirected_to root_path, "not redirected"
  end

  test "free user cannot create private wikis or pages" do
    assert_no_difference "Wiki.count", "wiki created" do
      post wikis_path
    end
    assert_redirected_to root_path, "not redirected"

    assert_no_difference "Page.count", "page created" do
      post wiki_pages_path(@public_wiki1)
    end
    assert_redirected_to root_path, "not redirected"
  end

  test "free user can update public wikis or pages" do
    put wiki_path(@public_wiki1), name: "New name"
    @public_wiki1.reload
    assert_equal "New name", @public_wiki1.name, "wiki not updated"
    # assert_redirected_to root_path, "not redirected"

    put wiki_page_path(@public_wiki1, @public_page1), title: "New title"
    @public_page1.reload
    assert_equal "New title", @public_page1.title, "page not updated"
    # assert_redirected_to root_path, "not redirected"
  end
end
