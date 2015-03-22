class ChangeWikiAndPageDefaults < ActiveRecord::Migration
  def change
    change_column_default :wikis, :name, "Click here to change the wiki name"
    change_column_default :pages, :title, "Click here to change the page title"
    change_column_default :pages, :content, "Click here to change the content of this page"
  end
end
