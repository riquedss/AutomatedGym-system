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

ActiveRecord::Schema[7.0].define(version: 2023_02_03_050053) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_gym_sheets", force: :cascade do |t|
    t.integer "sets"
    t.integer "repetition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exercise_id", null: false
    t.bigint "gym_sheet_id", null: false
    t.index ["exercise_id"], name: "index_exercise_gym_sheets_on_exercise_id"
    t.index ["gym_sheet_id"], name: "index_exercise_gym_sheets_on_gym_sheet_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name", null: false
    t.integer "muscle_group", null: false
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_sheets", force: :cascade do |t|
    t.string "description"
    t.string "objective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "last_name"
    t.integer "gender"
    t.integer "age"
    t.integer "height"
    t.integer "role"
    t.integer "objective"
    t.string "email", default: "", null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "exercise_gym_sheets", "exercises"
  add_foreign_key "exercise_gym_sheets", "gym_sheets"
end
