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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110828202007) do

  create_table "activities", :force => true do |t|
    t.string   "model_title",    :limit => 64
    t.string   "model_class",    :limit => 32
    t.integer  "model_id"
    t.integer  "model_position"
    t.string   "action",         :limit => 16
    t.string   "backup"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["model_class"], :name => "index_activities_on_model_class"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "cables", :force => true do |t|
    t.string   "identifier"
    t.integer  "user_id"
    t.text     "body"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cables", ["identifier"], :name => "index_cables_on_identifier"
  add_index "cables", ["user_id"], :name => "index_cables_on_user_id"

  create_table "translations", :force => true do |t|
    t.integer  "cable_id"
    t.integer  "user_id"
    t.string   "subject"
    t.text     "body"
    t.string   "lang"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "summary",    :limit => 512
    t.string   "accuracy",   :limit => 8
  end

  add_index "translations", ["cable_id"], :name => "index_translations_on_cable_id"
  add_index "translations", ["user_id"], :name => "index_translations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "twitter"
    t.datetime "last_login_at"
    t.integer  "login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
