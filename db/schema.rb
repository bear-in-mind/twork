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

ActiveRecord::Schema.define(version: 2018_08_27_140509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_files", force: :cascade do |t|
    t.string "name"
    t.string "audio"
    t.bigint "user_id"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_audio_files_on_session_id"
    t.index ["user_id"], name: "index_audio_files_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.time "track_instant"
    t.bigint "user_id"
    t.bigint "audio_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_file_id"], name: "index_comments_on_audio_file_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_messages_on_track_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "updated_at", null: false
    t.date "deadline"
    t.datetime "created_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "status"
    t.bigint "track_id"
    t.bigint "talent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talent_id"], name: "index_sessions_on_talent_id"
    t.index ["track_id"], name: "index_sessions_on_track_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talents", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_talents_on_skill_id"
    t.index ["user_id"], name: "index_talents_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.index ["project_id"], name: "index_tracks_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.string "banner"
    t.text "bio"
    t.string "genres"
    t.string "main_occupation"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audio_files", "sessions"
  add_foreign_key "audio_files", "users"
  add_foreign_key "comments", "audio_files"
  add_foreign_key "comments", "users"
  add_foreign_key "messages", "tracks"
  add_foreign_key "messages", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "sessions", "talents"
  add_foreign_key "sessions", "tracks"
  add_foreign_key "talents", "skills"
  add_foreign_key "talents", "users"
  add_foreign_key "tracks", "projects"
end
