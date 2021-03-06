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

ActiveRecord::Schema.define(version: 2018_12_23_163952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "car_type", default: 0, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "drivers", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "driver_type", default: 0, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "drivers_races", id: false, force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "driver_id", null: false
    t.index ["driver_id", "race_id"], name: "index_drivers_races_on_driver_id_and_race_id"
    t.index ["race_id", "driver_id"], name: "index_drivers_races_on_race_id_and_driver_id"
  end

  create_table "races", id: :serial, force: :cascade do |t|
    t.integer "car_id"
    t.integer "customer_id"
    t.float "cargo_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float "race_price", default: 0.0
    t.index ["car_id"], name: "index_races_on_car_id"
    t.index ["customer_id"], name: "index_races_on_customer_id"
    t.index ["user_id"], name: "index_races_on_user_id"
  end

  create_table "reports", id: :serial, force: :cascade do |t|
    t.integer "mileage", null: false
    t.float "fuel", null: false
    t.float "fuel_cost", null: false
    t.integer "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_reports_on_race_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id"
    t.string "avatar"
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "races", "cars"
  add_foreign_key "races", "customers"
  add_foreign_key "reports", "races"
  add_foreign_key "user_profiles", "users"
end
