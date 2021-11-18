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

ActiveRecord::Schema.define(version: 2021_11_18_214028) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "contact_name"
    t.string "contact_phone"
    t.integer "facility_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id"], name: "index_areas_on_facility_id"
  end

  create_table "critical_levels", force: :cascade do |t|
    t.string "name"
    t.integer "frecuency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "device_types", force: :cascade do |t|
    t.string "name"
    t.text "protocol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "model"
    t.string "serial"
    t.date "last_maintenance"
    t.integer "area_id", null: false
    t.integer "device_type_id", null: false
    t.integer "critical_level_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_devices_on_area_id"
    t.index ["critical_level_id"], name: "index_devices_on_critical_level_id"
    t.index ["device_type_id"], name: "index_devices_on_device_type_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "lat"
    t.decimal "lng"
    t.string "contact_name"
    t.string "contact_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maintainers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "dni"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.text "observations"
    t.text "parts"
    t.string "state_before"
    t.string "state_after"
    t.string "maintenance_type"
    t.text "diagnostic"
    t.text "activities"
    t.integer "device_id", null: false
    t.integer "maintainer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_maintenances_on_device_id"
    t.index ["maintainer_id"], name: "index_maintenances_on_maintainer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "user_type"
    t.integer "maintainer_id"
    t.integer "facility_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "areas", "facilities"
  add_foreign_key "devices", "areas"
  add_foreign_key "devices", "critical_levels"
  add_foreign_key "devices", "device_types"
  add_foreign_key "maintenances", "devices"
  add_foreign_key "maintenances", "maintainers"
end
