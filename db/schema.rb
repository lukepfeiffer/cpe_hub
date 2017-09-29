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

ActiveRecord::Schema.define(version: 20170929215643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authem_sessions", force: :cascade do |t|
    t.string   "role",                    null: false
    t.integer  "subject_id",              null: false
    t.string   "subject_type",            null: false
    t.string   "token",        limit: 60, null: false
    t.datetime "expires_at",              null: false
    t.integer  "ttl",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authem_sessions", ["expires_at", "subject_type", "subject_id"], name: "index_authem_sessions_subject", using: :btree
  add_index "authem_sessions", ["expires_at", "token"], name: "index_authem_sessions_on_expires_at_and_token", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_type"
    t.string   "name"
    t.string   "course_code"
    t.text     "description"
    t.integer  "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "desc_preview"
  end

  create_table "discussions", force: :cascade do |t|
    t.string   "question"
    t.integer  "course_id"
    t.integer  "user_id"
    t.text     "description"
    t.text     "admin_notes"
    t.integer  "flag_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: :cascade do |t|
    t.text     "answer"
    t.text     "question"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professor_courses", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", force: :cascade do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.string   "password_reset_token", limit: 60, null: false
    t.string   "confirm_token"
    t.boolean  "confirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "access_level"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "discussion_id"
    t.integer "comment_id"
    t.integer "value"
  end

end
