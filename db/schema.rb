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

ActiveRecord::Schema.define(version: 20150901122936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "workout_id"
    t.integer  "wod_id"
    t.text     "notes"
    t.date     "date",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["user_id"], name: "index_logs_on_user_id", using: :btree
  add_index "logs", ["wod_id"], name: "index_logs_on_wod_id", using: :btree
  add_index "logs", ["workout_id"], name: "index_logs_on_workout_id", using: :btree

  create_table "move_logs", force: :cascade do |t|
    t.integer "log_id",                      null: false
    t.integer "move_id",                     null: false
    t.integer "reps",            default: 0, null: false
    t.integer "weight_kilos",    default: 0, null: false
    t.integer "distance_meters", default: 0, null: false
    t.integer "height_meters",   default: 0, null: false
    t.integer "time_seconds",    default: 0, null: false
  end

  add_index "move_logs", ["log_id"], name: "index_move_logs_on_log_id", using: :btree
  add_index "move_logs", ["move_id"], name: "index_move_logs_on_move_id", using: :btree

  create_table "moves", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "exercise_id"
    t.integer "reps",            default: 0, null: false
    t.integer "weight_kilos",    default: 0, null: false
    t.integer "distance_meters", default: 0, null: false
    t.integer "height_meters",   default: 0, null: false
    t.integer "time_seconds",    default: 0, null: false
  end

  add_index "moves", ["exercise_id"], name: "index_moves_on_exercise_id", using: :btree
  add_index "moves", ["workout_id"], name: "index_moves_on_workout_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "wods", force: :cascade do |t|
    t.integer  "workout_id", null: false
    t.date     "date",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wods", ["workout_id"], name: "index_wods_on_workout_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.string   "title",                           null: false
    t.text     "description"
    t.text     "pre_workout"
    t.text     "special_pre_workout"
    t.text     "post_workout"
    t.integer  "rounds",              default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "logs", "users"
  add_foreign_key "logs", "wods"
  add_foreign_key "logs", "workouts"
  add_foreign_key "move_logs", "logs"
  add_foreign_key "move_logs", "moves"
  add_foreign_key "moves", "exercises"
  add_foreign_key "moves", "workouts"
  add_foreign_key "wods", "workouts"
end
