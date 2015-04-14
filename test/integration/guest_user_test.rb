require 'test_helper'

class GuestUserTest < ActionDispatch::IntegrationTest

  def setup
    @public_wiki1 = wikis(:public_wiki1)
    @public_wiki2 = wikis(:public_wiki2)
    @private_wiki1 = wikis(:private_wiki1)

    @public_page1 = pages(:public_page1)
    @public_page2 = pages(:public_page2)
    @private_page1 = pages(:private_page1)
  end

  test "guest sees landing page at root" do
    get_via_redirect '/'
    assert_response :success, "couldn't access root"
    assert_equal path, root_path, "guest user redirected"
    assert_template :landing, "wrong template"
  end

  test "guest only sees public wikis in index" do
    visit wikis_path
    assert_equal current_path, wikis_path, "at wrong path"
    assert page.has_content?(@public_wiki1.name), "public wiki missing"
    assert page.has_content?(@public_wiki2.name), "public wiki missing"
    assert page.has_no_content?(@private_wiki1.name), "private wiki shown"
  end

  test "guest can view public wikis" do
    visit wiki_path(@public_wiki1)
    assert_equal current_path, wiki_path(@public_wiki1), "redirected"
    assert page.has_content?(@public_page1.title), "page not found"
  end

  test "guest cannot view private wikis" do
    visit wiki_path(@private_wiki1)
    assert_equal current_path, root_path, "not redirected"
  end

  test "guest cannot create wikis or pages" do
    assert_no_difference "Wiki.count", "wiki created" do
      post wikis_path
    end
    assert_redirected_to root_path, "not redirected"

    assert_no_difference "Page.count", "page created" do
      post wiki_pages_path(@public_wiki1)
    end
    assert_redirected_to root_path, "not redirected"
  end

  test "guest cannot update wikis or pages" do
    assert_no_difference "@public_wiki1.updated_at", "wiki updated" do
      put wiki_path(@public_wiki1), name: "New name"
    end
    assert_redirected_to root_path, "not redirected"

    assert_no_difference "@public_page1.updated_at", "page updated" do
      put wiki_page_path(@public_wiki1, @public_page1), title: "New title"
    end
    assert_redirected_to root_path, "not redirected"
  end
end
