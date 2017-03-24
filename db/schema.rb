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

ActiveRecord::Schema.define(version: 20170324003751) do

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_comments_on_room_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "room_id"
    t.string   "sub"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["room_id"], name: "index_pictures_on_room_id"
  end

  create_table "rent_histories", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.date     "in"
    t.date     "out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_rent_histories_on_room_id"
    t.index ["user_id"], name: "index_rent_histories_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.date     "in"
    t.date     "out"
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_requests_on_room_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "address"
    t.string   "desc"
    t.integer  "guests"
    t.integer  "beds"
    t.float    "price"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "title"
    t.integer  "user_id"
    t.boolean  "available",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "desc"
    t.string   "password_digest",      null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "wishes", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_wishes_on_room_id"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

end
