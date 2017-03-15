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

ActiveRecord::Schema.define(version: 20170311214020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string  "street_address"
    t.string  "neighbourhood"
    t.integer "space_id"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "city"
    t.string  "province"
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

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "space_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "note"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "approved",   default: false
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

  create_table "conversations", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true, using: :btree
    t.index ["author_id"], name: "index_conversations_on_author_id", using: :btree
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id", using: :btree
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "favourited_type"
    t.integer  "favourited_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["favourited_type", "favourited_id"], name: "index_favourites_on_favourited_type_and_favourited_id", using: :btree
    t.index ["user_id"], name: "index_favourites_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_personal_messages_on_user_id", using: :btree
  end

  create_table "region", force: :cascade do |t|
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "space_id"
    t.integer  "booking_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "accuracy"
    t.integer  "communication"
    t.integer  "facilities"
    t.integer  "location"
    t.integer  "helpful_count", default: 0
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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "host_id"
    t.string   "avatar"
    t.string   "disabled_dates", default: [],              array: true
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "vote",          default: false, null: false
    t.string   "voteable_type",                 null: false
    t.integer  "voteable_id",                   null: false
    t.string   "voter_type"
    t.integer  "voter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type", using: :btree
    t.index ["voter_id", "voter_type", "voteable_id", "voteable_type"], name: "fk_one_vote_per_user_per_entity", unique: true, using: :btree
    t.index ["voter_id", "voter_type"], name: "index_votes_on_voter_id_and_voter_type", using: :btree
  end

  add_foreign_key "personal_messages", "conversations"
  add_foreign_key "personal_messages", "users"
end
