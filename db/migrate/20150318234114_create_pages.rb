class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.references :wiki, index: true

      t.timestamps null: false
    end
    add_foreign_key :pages, :wikis
  end
end
