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

ActiveRecord::Schema.define(version: 20151104154907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "location_id",    null: false
    t.integer  "swell_model_id"
    t.string   "title",          null: false
    t.text     "body"
    t.integer  "rating"
    t.date     "date",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id",                   null: false
    t.integer "friend_id",                 null: false
    t.boolean "accepted",  default: false, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string  "name",        null: false
    t.integer "msw_id",      null: false
    t.string  "description"
    t.float   "lat",         null: false
    t.float   "lon",         null: false
    t.string  "msw_url",     null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer "entry_id",  null: false
    t.string  "file_name", null: false
  end

  create_table "swell_models", force: :cascade do |t|
    t.json    "swell_data"
    t.integer "entry_id",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "profile_photo"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "region"
    t.string   "user_name",                                 null: false
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree

end
