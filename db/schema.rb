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

ActiveRecord::Schema.define(version: 20140209165611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communities_users", id: false, force: :cascade do |t|
    t.integer "community_id", null: false
    t.integer "user_id",      null: false
  end

  add_index "communities_users", ["community_id", "user_id"], name: "index_communities_users_on_community_id_and_user_id", using: :btree
  add_index "communities_users", ["user_id", "community_id"], name: "index_communities_users_on_user_id_and_community_id", using: :btree

  create_table "exercise_sessions", force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "user_id"
    t.boolean "pr"
    t.text    "comment"
    t.text    "mod"
    t.boolean "accomplished"
    t.text    "status"
    t.integer "workout_id"
    t.boolean "modified"
    t.integer "exercise_mod"
  end

  add_index "exercise_sessions", ["exercise_id"], name: "index_exercise_sessions_on_exercise_id", using: :btree
  add_index "exercise_sessions", ["user_id"], name: "index_exercise_sessions_on_user_id", using: :btree
  add_index "exercise_sessions", ["workout_id"], name: "index_exercise_sessions_on_workout_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.text     "name"
    t.text     "detail"
    t.text     "duration"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "video_id"
  end

  add_index "exercises", ["workout_id"], name: "index_exercises_on_workout_id", using: :btree

  create_table "exercises_workouts", id: false, force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "workout_id",  null: false
  end

  add_index "exercises_workouts", ["exercise_id", "workout_id"], name: "index_exercises_workouts_on_exercise_id_and_workout_id", using: :btree
  add_index "exercises_workouts", ["workout_id", "exercise_id"], name: "index_exercises_workouts_on_workout_id_and_exercise_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.text     "username",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "mantra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workout_sessions", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "user_id"
    t.boolean "pr"
    t.text    "comment"
    t.boolean "accomplished"
  end

  add_index "workout_sessions", ["user_id"], name: "index_workout_sessions_on_user_id", using: :btree
  add_index "workout_sessions", ["workout_id"], name: "index_workout_sessions_on_workout_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.text     "name"
    t.text     "difficulty"
    t.boolean  "posted"
    t.boolean  "started"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "community_id"
  end

  add_index "workouts", ["community_id"], name: "index_workouts_on_community_id", using: :btree
  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree

end
