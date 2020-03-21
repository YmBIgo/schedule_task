# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_21_161335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string "p_name", default: "", null: false
    t.string "role", default: "", null: false
    t.integer "role_id", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "t_name", default: "", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "role", default: "", null: false
    t.integer "parent_task_id", null: false
    t.integer "following_task_id", null: false
    t.integer "t_number", null: false
    t.integer "work_id", null: false
    t.integer "person_id", null: false
    t.integer "before_date", default: 1, null: false
    t.integer "date_duration", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url", default: "", null: false
    t.text "details", default: "", null: false
    t.string "reference_url", default: "", null: false
    t.string "reference_image", default: "", null: false
    t.text "reference_text", default: "", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "w_name", default: "", null: false
    t.text "content", default: "", null: false
    t.integer "w_percent", null: false
    t.string "w_url", default: "", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
