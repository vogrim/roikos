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

ActiveRecord::Schema.define(version: 20150216153857) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bill_items", force: true do |t|
    t.integer  "bill_id"
    t.integer  "product_id"
    t.text     "label"
    t.integer  "tax"
    t.float    "unit_price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", force: true do |t|
    t.integer  "client_id"
    t.date     "sent_at"
    t.date     "payed_at"
    t.string   "label"
    t.string   "shipping_label"
    t.float    "shipping_price"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "brands", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "client_interactions", force: true do |t|
    t.datetime "scheduled_at"
    t.datetime "interaction_at"
    t.integer  "client_id"
    t.integer  "user_id"
    t.string   "method"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "company"
    t.string   "salutation"
    t.string   "title"
    t.string   "firstname"
    t.string   "surname"
    t.string   "email"
    t.string   "website"
    t.string   "phone",      limit: 30
    t.string   "fax",        limit: 30
    t.string   "street"
    t.string   "zipcode",    limit: 15
    t.string   "location"
    t.string   "country"
    t.string   "group"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commission_items", force: true do |t|
    t.integer  "commission_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissions", force: true do |t|
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "client_id"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.datetime "event_at"
    t.date     "agreed_at"
    t.integer  "client_id"
    t.integer  "audience_count"
    t.string   "audience_age_class"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movement_types", force: true do |t|
    t.string   "title"
    t.boolean  "increase_state", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movements", force: true do |t|
    t.date     "movement_at"
    t.integer  "count"
    t.integer  "product_id"
    t.integer  "movement_type_id"
    t.integer  "client_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "shortcut"
    t.string   "isbn_13"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "firstname"
    t.string   "surname"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
