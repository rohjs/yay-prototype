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

ActiveRecord::Schema.define(version: 20180427121854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "requiremensed"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requirement_id"], name: "index_assignments_on_requirement_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "category"
    t.integer "level"
    t.integer "credit"
    t.integer "capacity"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "closing_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.bigint "course_id"
    t.string "title"
    t.string "description"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_requirements_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "user_type"
    t.string "phone_number"
    t.integer "department"
    t.string "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "requirements"
  add_foreign_key "assignments", "users"
  add_foreign_key "requirements", "courses"
end
