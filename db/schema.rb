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

ActiveRecord::Schema[7.1].define(version: 2024_08_05_102825) do
  create_table "accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "business_id", null: false
    t.index ["active"], name: "index_accounts_on_active"
    t.index ["business_id"], name: "index_accounts_on_business_id"
  end

  create_table "accounts_drivers", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "driver_id", null: false
  end

  create_table "businesses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_businesses_on_code", unique: true
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_category_id"
    t.index ["name"], name: "index_categories_on_name", unique: true
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id"
  end

  create_table "categories_items", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "category_id", null: false
  end

  create_table "customer_addresses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "address_line_1", null: false
    t.string "address_line_2", null: false
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_line_1", "city", "state", "zip"], name: "idx_on_address_line_1_city_state_zip_e5170693c0", length: { address_line_1: 100, city: 20, state: 20, zip: 10 }
    t.index ["customer_id"], name: "index_customer_addresses_on_customer_id"
    t.index ["zip"], name: "index_customer_addresses_on_zip"
  end

  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", null: false
    t.bigint "business_id"
    t.boolean "active", default: true
    t.string "email", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number_2"
    t.string "phone_number_3"
    t.string "last_name"
    t.index ["business_id", "first_name"], name: "index_customers_on_business_id_and_first_name"
    t.index ["business_id"], name: "index_customers_on_business_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["first_name"], name: "index_customers_on_first_name"
    t.index ["phone_number"], name: "index_customers_on_phone_number", unique: true
  end

  create_table "drivers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "business_id", null: false
    t.boolean "active", default: true
    t.string "license_number", null: false
    t.string "license_state", null: false
    t.bigint "account_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_number"
    t.index ["account_id"], name: "index_drivers_on_account_id"
    t.index ["business_id"], name: "index_drivers_on_business_id"
    t.index ["license_number"], name: "index_drivers_on_license_number", unique: true
  end

  create_table "items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description", null: false
    t.string "serial_number", null: false
    t.integer "quantity", default: 0
    t.decimal "weight", precision: 4, scale: 1, default: "0.0"
    t.decimal "amount", precision: 7, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "setup_time"
    t.bigint "order_id", null: false
    t.index ["order_id"], name: "index_items_on_order_id"
    t.index ["serial_number"], name: "index_items_on_serial_number", unique: true
  end

  create_table "notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "message"
    t.string "notifiable_type"
    t.integer "notifiable_id"
    t.boolean "read_status", default: false
    t.string "priority_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "order_date"
    t.string "status"
    t.bigint "business_id", null: false
    t.boolean "active", default: true
    t.bigint "account_id", null: false
    t.string "number", null: false
    t.string "time_window_start"
    t.string "time_window_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["account_id"], name: "index_orders_on_account_id"
    t.index ["business_id", "active", "status"], name: "index_orders_on_business_id_and_active_and_status"
    t.index ["business_id", "order_date"], name: "index_orders_on_business_id_and_order_date"
    t.index ["business_id"], name: "index_orders_on_business_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["number"], name: "index_orders_on_number", unique: true
  end

  create_table "routes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "service_unit_id", null: false
    t.bigint "truck_id", null: false
    t.bigint "driver_id", null: false
    t.date "date"
    t.string "start_time"
    t.string "end_time"
    t.decimal "total_distance", precision: 5, scale: 2
    t.datetime "job_start"
    t.datetime "job_finish"
    t.boolean "route_locked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_routes_on_date"
    t.index ["driver_id"], name: "index_routes_on_driver_id"
    t.index ["service_unit_id", "date"], name: "index_routes_on_service_unit_id_and_date", unique: true
    t.index ["service_unit_id"], name: "index_routes_on_service_unit_id"
    t.index ["truck_id"], name: "index_routes_on_truck_id"
  end

  create_table "schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "service_unit_id", null: false
    t.bigint "order_id", null: false
    t.bigint "route_id", null: false
    t.date "date"
    t.string "start_time"
    t.string "end_time"
    t.integer "stop_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "service_unit_id"], name: "index_schedules_on_date_and_service_unit_id"
    t.index ["order_id"], name: "index_schedules_on_order_id"
    t.index ["route_id"], name: "index_schedules_on_route_id"
    t.index ["service_unit_id"], name: "index_schedules_on_service_unit_id"
  end

  create_table "service_units", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "business_id", null: false
    t.boolean "active", default: true
    t.string "service_unit_number", null: false
    t.string "start_time"
    t.string "end_time"
    t.bigint "default_truck_id", null: false
    t.bigint "default_driver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_service_units_on_account_id"
    t.index ["business_id", "active"], name: "index_service_units_on_business_id_and_active"
    t.index ["business_id"], name: "index_service_units_on_business_id"
    t.index ["default_driver_id"], name: "index_service_units_on_default_driver_id"
    t.index ["default_truck_id"], name: "index_service_units_on_default_truck_id"
    t.index ["name"], name: "index_service_units_on_name", unique: true
    t.index ["service_unit_number"], name: "index_service_units_on_service_unit_number", unique: true
  end

  create_table "specific_account_trucks", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "truck_id", null: false
  end

  create_table "survey_answers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "survey_question_id", null: false
    t.text "response", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_survey_answers_on_customer_id"
    t.index ["order_id"], name: "index_survey_answers_on_order_id"
    t.index ["survey_question_id", "order_id"], name: "index_survey_answers_on_survey_question_id_and_order_id", unique: true
    t.index ["survey_question_id"], name: "index_survey_answers_on_survey_question_id"
  end

  create_table "survey_questions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "business_id", null: false
    t.bigint "account_id", null: false
    t.boolean "active", default: true
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_survey_questions_on_account_id"
    t.index ["business_id"], name: "index_survey_questions_on_business_id"
    t.index ["content"], name: "index_survey_questions_on_content", unique: true, length: 333
  end

  create_table "trucks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "truck_number", null: false
    t.bigint "business_id", null: false
    t.bigint "account_id", null: false
    t.boolean "active", default: true
    t.decimal "maximum_load", precision: 5, scale: 2
    t.decimal "maximum_weight", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_trucks_on_account_id"
    t.index ["active"], name: "index_trucks_on_active"
    t.index ["business_id"], name: "index_trucks_on_business_id"
    t.index ["truck_number", "business_id"], name: "index_trucks_on_truck_number_and_business_id"
    t.index ["truck_number"], name: "index_trucks_on_truck_number", unique: true
  end

  add_foreign_key "accounts", "businesses"
  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "customer_addresses", "customers"
  add_foreign_key "customers", "businesses"
  add_foreign_key "drivers", "accounts"
  add_foreign_key "drivers", "businesses"
  add_foreign_key "items", "orders"
  add_foreign_key "orders", "accounts"
  add_foreign_key "orders", "businesses"
  add_foreign_key "orders", "customers"
  add_foreign_key "routes", "drivers"
  add_foreign_key "routes", "service_units"
  add_foreign_key "routes", "trucks"
  add_foreign_key "schedules", "orders"
  add_foreign_key "schedules", "routes"
  add_foreign_key "schedules", "service_units"
  add_foreign_key "service_units", "accounts"
  add_foreign_key "service_units", "businesses"
  add_foreign_key "service_units", "drivers", column: "default_driver_id"
  add_foreign_key "service_units", "trucks", column: "default_truck_id"
  add_foreign_key "survey_answers", "customers"
  add_foreign_key "survey_answers", "orders"
  add_foreign_key "survey_answers", "survey_questions"
  add_foreign_key "survey_questions", "accounts"
  add_foreign_key "survey_questions", "businesses"
  add_foreign_key "trucks", "accounts"
  add_foreign_key "trucks", "businesses"
end
