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

ActiveRecord::Schema.define(version: 2021_06_04_190726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "causes", force: :cascade do |t|
    t.string "image"
    t.string "theme"
    t.text "description"
    t.string "status"
    t.integer "funds_needed", default: 0
    t.integer "funds_raised", default: 0
    t.integer "commitments_count", default: 0
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_causes_on_owner_id"
  end

  create_table "commitments", force: :cascade do |t|
    t.string "target"
    t.text "description"
    t.integer "donation_size", default: 0
    t.string "status"
    t.bigint "cause_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cause_id"], name: "index_commitments_on_cause_id"
    t.index ["owner_id"], name: "index_commitments_on_owner_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.bigint "cause_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cause_id"], name: "index_favorites_on_cause_id"
    t.index ["owner_id"], name: "index_favorites_on_owner_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.bigint "cause_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cause_id"], name: "index_posts_on_cause_id"
    t.index ["owner_id"], name: "index_posts_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "causes", "users", column: "owner_id"
  add_foreign_key "commitments", "causes"
  add_foreign_key "commitments", "users", column: "owner_id"
  add_foreign_key "favorites", "causes"
  add_foreign_key "favorites", "users", column: "owner_id"
  add_foreign_key "posts", "causes"
  add_foreign_key "posts", "users", column: "owner_id"
end
