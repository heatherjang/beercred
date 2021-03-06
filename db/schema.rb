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

ActiveRecord::Schema.define(version: 20150228011525) do

  create_table "admins", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inventory",  default: 0
  end

  create_table "transactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "num_purchased"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "admin_id"
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.integer  "beer_count",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "credit_card"
  end

end
