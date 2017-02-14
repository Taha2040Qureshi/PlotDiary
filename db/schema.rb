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

ActiveRecord::Schema.define(version: 20170213121148) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.text     "address_1",              limit: 65535
    t.string   "address_2",              limit: 255
    t.string   "phone_number1",          limit: 255
    t.string   "secondary_phone_number", limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "cnic",           limit: 255
    t.integer  "address_id",     limit: 4
    t.integer  "plot_id",        limit: 4
    t.integer  "installment_id", limit: 4
    t.string   "status",         limit: 255
    t.integer  "town_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "f_name",         limit: 255
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "address_id",  limit: 4
    t.integer  "town_id",     limit: 4
    t.float    "salary",      limit: 24
    t.string   "designation", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "f_name",      limit: 255
    t.string   "cnic",        limit: 255
  end

  create_table "expense_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "town_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.float    "amount",          limit: 24
    t.boolean  "status"
    t.integer  "town_id",         limit: 4
    t.integer  "expense_type_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "description",     limit: 65535
  end

  create_table "given_installments", force: :cascade do |t|
    t.integer  "installment_id", limit: 4
    t.integer  "town_id",        limit: 4
    t.datetime "submit_date"
    t.integer  "land_master_id", limit: 4
    t.boolean  "status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "installments", force: :cascade do |t|
    t.boolean  "status"
    t.integer  "town_id",                      limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.float    "total_amount",                 limit: 24
    t.float    "advance_amount",               limit: 24
    t.integer  "total_number_of_installments", limit: 4
    t.float    "per_installments_amount",      limit: 24
    t.integer  "installment_type",             limit: 4
  end

  create_table "investments", force: :cascade do |t|
    t.float    "amount",          limit: 24
    t.integer  "town_id",         limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "stake_holder_id", limit: 4
  end

  create_table "land_masters", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "address_id",     limit: 4
    t.integer  "town_id",        limit: 4
    t.integer  "installment_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "f_name",         limit: 255
    t.string   "cnic",           limit: 255
  end

  create_table "payments", force: :cascade do |t|
    t.float    "amount",          limit: 24
    t.datetime "date"
    t.boolean  "status"
    t.integer  "employee_id",     limit: 4
    t.integer  "land_master_id",  limit: 4
    t.integer  "expense_id",      limit: 4
    t.integer  "town_id",         limit: 4
    t.integer  "customer_id",     limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "payment_type",    limit: 255
    t.integer  "stake_holder_id", limit: 4
    t.string   "payment_status",  limit: 255
  end

  create_table "plots", force: :cascade do |t|
    t.integer  "plot_number", limit: 4
    t.float    "total_price", limit: 24
    t.float    "area",        limit: 24
    t.float    "length",      limit: 24
    t.float    "width",       limit: 24
    t.integer  "town_id",     limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "status",      limit: 4,  default: 0
  end

  create_table "stake_holders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "address_id", limit: 4
    t.integer  "town_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "f_name",     limit: 255
    t.string   "cnic",       limit: 255
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "expense_id",  limit: 4
    t.integer  "town_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
  end

  create_table "submit_installments", force: :cascade do |t|
    t.integer  "installment_id", limit: 4
    t.integer  "town_id",        limit: 4
    t.datetime "submit_date"
    t.integer  "customer_id",    limit: 4
    t.boolean  "status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "towns", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "address_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.integer  "town_id",                limit: 4
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "user_type",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
