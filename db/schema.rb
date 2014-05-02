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

ActiveRecord::Schema.define(version: 20140502142317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documentaries", force: true do |t|
    t.string  "title"
    t.text    "description"
    t.string  "video_source"
    t.integer "uploader_user"
    t.integer "likes"
    t.integer "dislikes"
    t.string  "thumbnail_url"
    t.integer "total_rating"
    t.string  "category"
    t.string  "video_service"
  end

  create_table "reviews", force: true do |t|
    t.text    "message"
    t.boolean "is_positive"
    t.integer "user_id"
    t.integer "documentary_id"
  end

  create_table "users", force: true do |t|
    t.string "username"
    t.string "email_address"
    t.string "password_hash"
    t.string "password_salt"
  end

end
