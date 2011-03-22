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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110322214240) do

  create_table "gits", :force => true do |t|
    t.string   "repository_url"
    t.string   "clone_url"
    t.string   "name"
    t.text     "public_key"
    t.text     "private_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.integer  "git_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_repositories", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "repository_id"
  end

  create_table "groups_users", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "key_pairs", :force => true do |t|
    t.integer  "user_id"
    t.string   "type"
    t.text     "public_key"
    t.text     "private_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", :force => true do |t|
    t.integer  "git_id"
    t.string   "name"
    t.string   "description"
    t.integer  "owner"
    t.integer  "visibility_level"
    t.boolean  "gitweb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories_users", :id => false, :force => true do |t|
    t.integer "repository_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.integer  "git_id"
    t.string   "user_name"
    t.string   "real_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
