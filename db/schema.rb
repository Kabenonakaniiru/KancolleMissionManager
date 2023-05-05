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

ActiveRecord::Schema.define(version: 2020_11_21_142816) do

  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "areas", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.integer "level", limit: 1, default: 1, null: false
    t.bigint "parent_area_id"
    t.string "name", limit: 3, null: false
    t.string "column_name", limit: 7
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.index ["level", "parent_area_id", "name"], name: "index_areas_on_level_and_parent_area_id_and_name", unique: true
    t.index ["parent_area_id"], name: "index_areas_on_parent_area_id"
    t.check_constraint "((`level` = 1) and (`parent_area_id` is null)) or ((2 <= `level`) and (`level` <= 3) and (`parent_area_id` is not null))", name: "check_areas_parent_area"
    t.check_constraint "(1 <= `level`) and (`level` <= 3)", name: "check_areas_level"
  end

  create_table "classifications", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.index ["name"], name: "index_classifications_on_name", unique: true
  end

  create_table "missions", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "classification_id", null: false
    t.boolean "limited", default: false, null: false
    t.string "url"
    t.string "note"
    t.integer "n_1_1", limit: 1, default: 0, null: false
    t.integer "n_1_2", limit: 1, default: 0, null: false
    t.integer "n_1_3", limit: 1, default: 0, null: false
    t.integer "n_1_4", limit: 1, default: 0, null: false
    t.integer "n_1_5", limit: 1, default: 0, null: false
    t.integer "n_1_6", limit: 1, default: 0, null: false
    t.integer "n_2_1", limit: 1, default: 0, null: false
    t.integer "n_2_2", limit: 1, default: 0, null: false
    t.integer "n_2_3", limit: 1, default: 0, null: false
    t.integer "n_2_4", limit: 1, default: 0, null: false
    t.integer "n_2_5", limit: 1, default: 0, null: false
    t.integer "n_3_1", limit: 1, default: 0, null: false
    t.integer "n_3_2", limit: 1, default: 0, null: false
    t.integer "n_3_3", limit: 1, default: 0, null: false
    t.integer "n_3_4", limit: 1, default: 0, null: false
    t.integer "n_3_5", limit: 1, default: 0, null: false
    t.integer "n_4_1", limit: 1, default: 0, null: false
    t.integer "n_4_2", limit: 1, default: 0, null: false
    t.integer "n_4_3", limit: 1, default: 0, null: false
    t.integer "n_4_4", limit: 1, default: 0, null: false
    t.integer "n_4_5", limit: 1, default: 0, null: false
    t.integer "n_5_1", limit: 1, default: 0, null: false
    t.integer "n_5_2", limit: 1, default: 0, null: false
    t.integer "n_5_3", limit: 1, default: 0, null: false
    t.integer "n_5_4", limit: 1, default: 0, null: false
    t.integer "n_5_5", limit: 1, default: 0, null: false
    t.integer "n_6_1", limit: 1, default: 0, null: false
    t.integer "n_6_2", limit: 1, default: 0, null: false
    t.integer "n_6_3", limit: 1, default: 0, null: false
    t.integer "n_6_4", limit: 1, default: 0, null: false
    t.integer "n_6_5", limit: 1, default: 0, null: false
    t.integer "n_7_1", limit: 1, default: 0, null: false
    t.integer "n_7_2_1", limit: 1, default: 0, null: false
    t.integer "n_7_2_2", limit: 1, default: 0, null: false
    t.integer "n_7_3_1", limit: 1, default: 0, null: false
    t.integer "n_7_3_2", limit: 1, default: 0, null: false
    t.integer "n_7_4", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.index ["classification_id"], name: "index_missions_on_classification_id"
    t.check_constraint "(0 <= `n_1_1`) and (`n_1_1` <= 99)", name: "check_missions_n_1_1"
    t.check_constraint "(0 <= `n_1_2`) and (`n_1_2` <= 99)", name: "check_missions_n_1_2"
    t.check_constraint "(0 <= `n_1_3`) and (`n_1_3` <= 99)", name: "check_missions_n_1_3"
    t.check_constraint "(0 <= `n_1_4`) and (`n_1_4` <= 99)", name: "check_missions_n_1_4"
    t.check_constraint "(0 <= `n_1_5`) and (`n_1_5` <= 99)", name: "check_missions_n_1_5"
    t.check_constraint "(0 <= `n_1_6`) and (`n_1_6` <= 99)", name: "check_missions_n_1_6"
    t.check_constraint "(0 <= `n_2_1`) and (`n_2_1` <= 99)", name: "check_missions_n_2_1"
    t.check_constraint "(0 <= `n_2_2`) and (`n_2_2` <= 99)", name: "check_missions_n_2_2"
    t.check_constraint "(0 <= `n_2_3`) and (`n_2_3` <= 99)", name: "check_missions_n_2_3"
    t.check_constraint "(0 <= `n_2_4`) and (`n_2_4` <= 99)", name: "check_missions_n_2_4"
    t.check_constraint "(0 <= `n_2_5`) and (`n_2_5` <= 99)", name: "check_missions_n_2_5"
    t.check_constraint "(0 <= `n_3_1`) and (`n_3_1` <= 99)", name: "check_missions_n_3_1"
    t.check_constraint "(0 <= `n_3_2`) and (`n_3_2` <= 99)", name: "check_missions_n_3_2"
    t.check_constraint "(0 <= `n_3_3`) and (`n_3_3` <= 99)", name: "check_missions_n_3_3"
    t.check_constraint "(0 <= `n_3_4`) and (`n_3_4` <= 99)", name: "check_missions_n_3_4"
    t.check_constraint "(0 <= `n_3_5`) and (`n_3_5` <= 99)", name: "check_missions_n_3_5"
    t.check_constraint "(0 <= `n_4_1`) and (`n_4_1` <= 99)", name: "check_missions_n_4_1"
    t.check_constraint "(0 <= `n_4_2`) and (`n_4_2` <= 99)", name: "check_missions_n_4_2"
    t.check_constraint "(0 <= `n_4_3`) and (`n_4_3` <= 99)", name: "check_missions_n_4_3"
    t.check_constraint "(0 <= `n_4_4`) and (`n_4_4` <= 99)", name: "check_missions_n_4_4"
    t.check_constraint "(0 <= `n_4_5`) and (`n_4_5` <= 99)", name: "check_missions_n_4_5"
    t.check_constraint "(0 <= `n_5_1`) and (`n_5_1` <= 99)", name: "check_missions_n_5_1"
    t.check_constraint "(0 <= `n_5_2`) and (`n_5_2` <= 99)", name: "check_missions_n_5_2"
    t.check_constraint "(0 <= `n_5_3`) and (`n_5_3` <= 99)", name: "check_missions_n_5_3"
    t.check_constraint "(0 <= `n_5_4`) and (`n_5_4` <= 99)", name: "check_missions_n_5_4"
    t.check_constraint "(0 <= `n_5_5`) and (`n_5_5` <= 99)", name: "check_missions_n_5_5"
    t.check_constraint "(0 <= `n_6_1`) and (`n_6_1` <= 99)", name: "check_missions_n_6_1"
    t.check_constraint "(0 <= `n_6_2`) and (`n_6_2` <= 99)", name: "check_missions_n_6_2"
    t.check_constraint "(0 <= `n_6_3`) and (`n_6_3` <= 99)", name: "check_missions_n_6_3"
    t.check_constraint "(0 <= `n_6_4`) and (`n_6_4` <= 99)", name: "check_missions_n_6_4"
    t.check_constraint "(0 <= `n_6_5`) and (`n_6_5` <= 99)", name: "check_missions_n_6_5"
    t.check_constraint "(0 <= `n_7_1`) and (`n_7_1` <= 99)", name: "check_missions_n_7_1"
    t.check_constraint "(0 <= `n_7_2_1`) and (`n_7_2_1` <= 99)", name: "check_missions_n_7_2_1"
    t.check_constraint "(0 <= `n_7_2_2`) and (`n_7_2_2` <= 99)", name: "check_missions_n_7_2_2"
    t.check_constraint "(0 <= `n_7_3_1`) and (`n_7_3_1` <= 99)", name: "check_missions_n_7_3_1"
    t.check_constraint "(0 <= `n_7_3_2`) and (`n_7_3_2` <= 99)", name: "check_missions_n_7_3_2"
    t.check_constraint "(0 <= `n_7_4`) and (`n_7_4` <= 99)", name: "check_missions_n_7_4"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "missions", "classifications"
end
