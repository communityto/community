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

ActiveRecord::Schema.define(version: 20170308212021) do

  create_table "addresses", force: :cascade do |t|
    t.string  "street_address"
    t.string  "neighbourhood"
    t.integer "space_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amenities_spaces", id: false, force: :cascade do |t|
    t.integer "amenity_id"
    t.integer "space_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "space_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.text     "note"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "approved",       default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_spaces", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "space_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "favourited_type"
    t.integer  "favourited_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["favourited_type", "favourited_id"], name: "index_favourites_on_favourited_type_and_favourited_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "region", force: :cascade do |t|
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "space_id"
    t.integer  "booking_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "accuracy"
    t.integer  "communication"
    t.integer  "facilities"
    t.integer  "location"
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.time     "check_in"
    t.time     "check_out"
    t.integer  "price"
    t.text     "rules"
    t.integer  "capacity"
    t.integer  "bathrooms"
    t.integer  "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "host_id"
    t.string   "avatar"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "avatar"
    t.text     "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
  end

end
