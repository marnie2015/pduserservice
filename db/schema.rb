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

ActiveRecord::Schema.define(version: 2018_08_15_023340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.string "access_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agent_users", force: :cascade do |t|
    t.string "branch_name"
    t.string "address"
    t.string "region"
    t.string "city"
    t.bigint "agent_id"
    t.bigint "user_id"
    t.time "office_hours_start"
    t.time "office_hours_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_users_on_agent_id"
    t.index ["user_id"], name: "index_agent_users_on_user_id"
  end

  create_table "agents", force: :cascade do |t|
    t.string "cde"
    t.string "fullname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_accesses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.bigint "access_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_id"], name: "index_role_accesses_on_access_id"
    t.index ["role_id"], name: "index_role_accesses_on_role_id"
    t.index ["user_id"], name: "index_role_accesses_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "category"
    t.string "sub_category"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.string "designation"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agent_users", "agents"
  add_foreign_key "agent_users", "users"
  add_foreign_key "role_accesses", "accesses"
  add_foreign_key "role_accesses", "roles"
  add_foreign_key "role_accesses", "users"
end