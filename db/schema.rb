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

ActiveRecord::Schema.define(version: 2019_12_20_194558) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "automobiles", force: :cascade do |t|
    t.string "model", limit: 128
    t.integer "color"
    t.integer "year", limit: 9999
    t.integer "type"
    t.string "plaque", limit: 7
    t.decimal "daily_cost", precision: 7, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leases", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "automobile_id", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time"
    t.datetime "entry_time"
    t.datetime "exit_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["automobile_id"], name: "index_leases_on_automobile_id"
    t.index ["person_id"], name: "index_leases_on_person_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "number", limit: 11, null: false
    t.date "validity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_licenses_on_person_id"
  end

  create_table "modalities", force: :cascade do |t|
    t.integer "license_id", null: false
    t.integer "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["license_id"], name: "index_modalities_on_license_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "surname", limit: 256, null: false
    t.string "cpf", limit: 11, null: false
    t.date "date_of_birth", null: false
    t.string "email", limit: 256, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "ddd", limit: 3, null: false
    t.string "number", limit: 9, null: false
    t.integer "type", null: false
    t.boolean "preferential", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_phones_on_person_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.text "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "leases", "automobiles"
  add_foreign_key "leases", "people"
  add_foreign_key "licenses", "people"
  add_foreign_key "modalities", "licenses"
  add_foreign_key "phones", "people"
end
