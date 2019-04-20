
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

ActiveRecord::Schema.define(version: 2019_04_20_170916) do

  create_table "booking_statuses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "accepted_at"
    t.datetime "cancelled_at"
    t.datetime "finish_at"
    t.float "rate"
    t.string "comment_rate"
    t.integer "booking_status_id"
    t.integer "service_id"
    t.integer "user_id"
    t.integer "operator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_status_id"], name: "index_bookings_on_booking_status_id"
    t.index ["operator_id"], name: "index_bookings_on_operator_id"
    t.index ["service_id"], name: "index_bookings_on_service_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.float "rate"
    t.string "national_id"
    t.integer "status_id"
    t.integer "workshop_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_operators_on_service_id"
    t.index ["status_id"], name: "index_operators_on_status_id"
    t.index ["workshop_id"], name: "index_operators_on_workshop_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_users_on_status_id"
  end

  create_table "work_shops", force: :cascade do |t|
    t.string "name"
    t.string "ubication"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
