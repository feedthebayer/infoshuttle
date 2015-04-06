# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150404183135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      default: "Click here to change the page title"
    t.text     "content",    default: "Click here to change the content of this page"
    t.integer  "wiki_id"
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

  add_index "pages", ["wiki_id"], name: "index_pages_on_wiki_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "username"
    t.string   "name"
    t.boolean  "premium",                      default: false
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "wikis", force: :cascade do |t|
    t.string   "name",       default: "Click here to change the wiki name"
    t.boolean  "public",     default: true
    t.integer  "user_id"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "wikis", ["user_id"], name: "index_wikis_on_user_id", using: :btree

  add_foreign_key "pages", "wikis"
  add_foreign_key "wikis", "users"
end
