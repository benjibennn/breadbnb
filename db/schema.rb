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

ActiveRecord::Schema.define(version: 20180430065021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.string  "name",          null: false
    t.integer "place_type"
    t.string  "property_type", null: false
    t.integer "room_number"
    t.integer "bed_number"
    t.integer "guest_number"
    t.string  "country",       null: false
    t.string  "state",         null: false
    t.string  "city",          null: false
    t.integer "zipcode"
    t.string  "address",       null: false
    t.integer "price"
    t.string  "description"
    t.integer "user_id"
    t.json    "images"
    t.integer "verification"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "listing_id"
    t.integer "user_id"
    t.date    "check_in"
    t.date    "check_out"
    t.index ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "fname"
    t.boolean  "gender"
    t.integer  "phone"
    t.string   "country"
    t.date     "birthday"
    t.integer  "role"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "users"
end
