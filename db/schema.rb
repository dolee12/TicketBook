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

ActiveRecord::Schema.define(version: 20141227062910) do

  create_table "stores", force: true do |t|
    t.integer  "user_id",                                           null: false
    t.string   "reg_no",      limit: 12,                            null: false
    t.string   "name",        limit: 100,                           null: false
    t.string   "tel",         limit: 20,                            null: false
    t.string   "address",                                           null: false
    t.decimal  "location",                precision: 18, scale: 12
    t.binary   "pic"
    t.string   "description"
    t.datetime "open_time",                                         null: false
    t.datetime "close_time",                                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["user_id"], name: "index_stores_on_user_id", using: :btree

  create_table "ticket_machines", force: true do |t|
    t.integer  "store_id",                   null: false
    t.string   "name"
    t.boolean  "enabled",    default: false, null: false
    t.integer  "ticket_seq", default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ticket_machines", ["store_id"], name: "index_ticket_machines_on_store_id", using: :btree

  create_table "tickets", force: true do |t|
    t.integer  "user_id",                       null: false
    t.integer  "ticket_machine_id",             null: false
    t.integer  "ticket_no",         default: 0, null: false
    t.integer  "people_cnt",        default: 1, null: false
    t.datetime "check_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["ticket_machine_id"], name: "index_tickets_on_ticket_machine_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",       limit: 20, null: false
    t.string   "phone",      limit: 20, null: false
    t.string   "passwd",     limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
