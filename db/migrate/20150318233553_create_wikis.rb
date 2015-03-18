class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :name
      t.boolean :public, default: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :wikis, :users
  end
end
