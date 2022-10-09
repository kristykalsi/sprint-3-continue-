# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_09_055341) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "body", default: ""
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_comments_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.string "course_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "unit_id", null: false
    t.boolean "enrolled"
    t.boolean "cy"
    t.boolean "awaiting_confirmation"
    t.boolean "profiling"
    t.boolean "missed"
    t.boolean "skills"
    t.boolean "ukt"
    t.boolean "waiting_on_staff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_grades_on_student_id"
    t.index ["unit_id"], name: "index_grades_on_unit_id"
  end

  create_table "student_classes", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_student_classes_on_course_id"
    t.index ["student_id"], name: "index_student_classes_on_student_id"
  end

  create_table "student_tasks", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_tasks_on_student_id"
    t.index ["task_id"], name: "index_student_tasks_on_task_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "uid"
    t.string "group"
    t.integer "student_id"
    t.string "name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "phone"
    t.string "home_school"
    t.string "external_email"
    t.string "usi"
    t.datetime "dob"
    t.boolean "lnn_assessment_registered_status"
    t.boolean "lnn_assessment_completed_status"
    t.boolean "enrolment_paperwork_completed__status"
    t.datetime "enrolment_paperwork_completed_date"
    t.string "enrolled_in_energySpace_userid"
    t.boolean "teams_group_and_chat_created_and_user_added_status"
    t.string "Comments"
    t.datetime "date"
    t.string "assessor_name"
    t.string "campus"
    t.boolean "yes_no_status"
    t.string "satisfactory"
    t.string "competency"
    t.string "course_code"
    t.string "course_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.bigint "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_tasks_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_name"
    t.string "unit_code"
    t.boolean "enrolled"
    t.boolean "cy"
    t.boolean "awaiting_confirmation"
    t.boolean "profiling"
    t.boolean "missed"
    t.boolean "skills"
    t.boolean "ukt"
    t.boolean "waiting_on_staff"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "students"
  add_foreign_key "grades", "students"
  add_foreign_key "grades", "units"
  add_foreign_key "student_classes", "courses"
  add_foreign_key "student_classes", "students"
  add_foreign_key "student_tasks", "students"
  add_foreign_key "student_tasks", "tasks"
  add_foreign_key "tasks", "units"
end
