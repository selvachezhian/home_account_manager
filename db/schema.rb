# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151114114031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "default_expenditures", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "default_expenditures", ["user_id"], name: "index_default_expenditures_on_user_id", using: :btree

  create_table "expenditures", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.text     "description"
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "default_expenditure_id"
  end

  add_index "expenditures", ["amount"], name: "index_expenditures_on_amount", using: :btree
  add_index "expenditures", ["default_expenditure_id"], name: "index_expenditures_on_default_expenditure_id", using: :btree
  add_index "expenditures", ["user_id"], name: "index_expenditures_on_user_id", using: :btree

  create_table "secret_values", force: :cascade do |t|
    t.integer  "secret_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "secret_values", ["secret_id"], name: "index_secret_values_on_secret_id", using: :btree

  create_table "secrets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "secret_values_count", default: 0
  end

  add_index "secrets", ["user_id"], name: "index_secrets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
