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

ActiveRecord::Schema.define(version: 2020_10_06_013855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "emailtoken", null: false
    t.string "token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "used", default: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "elevator_bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "start"
    t.datetime "end"
    t.integer "unit"
    t.integer "ownerType"
    t.string "name1"
    t.string "name2"
    t.string "phone_day"
    t.string "phone_night"
    t.integer "deposit"
    t.integer "moveType"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "approved"
    t.index ["user_id"], name: "index_elevator_bookings_on_user_id"
  end

  create_table "parkings", force: :cascade do |t|
    t.string "code"
    t.integer "unit"
    t.string "make"
    t.string "color"
    t.string "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "contact"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.boolean "required_answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "resource_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "time_limit", default: 60
    t.index ["resource_id"], name: "index_reservations_on_resource_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "resource_questions", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "resource_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_resource_questions_on_question_id"
    t.index ["resource_id"], name: "index_resource_questions_on_resource_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "time_limit", default: 60
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'user_type' for column 'type'

  add_foreign_key "authentications", "users"
  add_foreign_key "elevator_bookings", "users"
  add_foreign_key "reservations", "resources"
  add_foreign_key "reservations", "users"
  add_foreign_key "resource_questions", "questions"
  add_foreign_key "resource_questions", "resources"
end
