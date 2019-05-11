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

ActiveRecord::Schema.define(version: 20190511104232) do

  create_table "user_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "profile"
    t.string   "profile_image"
    t.string   "lastname",                  null: false
    t.string   "firstname",                 null: false
    t.string   "lastname_kana",             null: false
    t.string   "firstname_kana",            null: false
    t.integer  "birth_year"
    t.integer  "birth_month"
    t.integer  "birth_day"
    t.integer  "postal_code"
    t.integer  "prefecture"
    t.string   "city"
    t.string   "block_number"
    t.string   "building_name"
    t.integer  "phone_number"
    t.integer  "the_number_of_exhabitions"
    t.integer  "points"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "facebook_uid"
    t.string   "facebook_provider"
    t.string   "google_provider"
    t.string   "google_uid"
    t.string   "google_token"
    t.string   "google_meta"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "certification_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "user_profiles", "users"
end
