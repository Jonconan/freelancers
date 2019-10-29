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

ActiveRecord::Schema.define(version: 2019_10_29_084019) do

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "del_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.integer "region_id", null: false
    t.string "name", null: false
    t.boolean "del_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "del_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "user_code", null: false
    t.string "user_name", null: false
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "salt", null: false
    t.string "profile_image_path"
    t.integer "prefecture_id", null: false
    t.string "area"
    t.date "birthday", null: false
    t.integer "display_type", default: 0, null: false
    t.integer "status_id"
    t.string "twitter_id"
    t.string "facebook_id"
    t.string "github_id"
    t.string "youtube_id"
    t.string "website_url"
    t.boolean "del_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender_id", default: 0
  end

  create_table "workstyles", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "del_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
