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

ActiveRecord::Schema.define(version: 20160419180509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "schools", force: :cascade do |t|
    t.string   "name",                 null: false
    t.string   "nickname",             null: false
    t.string   "city",                 null: false
    t.string   "state",                null: false
    t.string   "motto",                null: false
    t.string   "email_domain",         null: false
    t.integer  "undergrad_population", null: false
    t.integer  "graduate_population",  null: false
    t.boolean  "public",               null: false
    t.string   "logo",                 null: false
    t.string   "mascot",               null: false
    t.integer  "date_founded",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.integer  "school_id",                           null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "photo_url",                           null: false
    t.string   "interests",                           null: false
    t.string   "year_in_college",                     null: false
    t.string   "living_situation",                    null: false
    t.string   "hometown",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "major",                               null: false
    t.string   "favorite_restaurant"
    t.string   "worst_campus_food"
    t.string   "sketchiest_moment"
    t.string   "biggest_misconception"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "tourists", force: :cascade do |t|
    t.string   "email",                        default: "", null: false
    t.string   "encrypted_password",           default: "", null: false
    t.string   "first_name",                                null: false
    t.string   "last_name",                                 null: false
    t.string   "prospective_major",                         null: false
    t.string   "intended_start_date_semester",              null: false
    t.integer  "intended_start_date_year",                  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "tourists", ["email"], name: "index_tourists_on_email", unique: true, using: :btree
  add_index "tourists", ["reset_password_token"], name: "index_tourists_on_reset_password_token", unique: true, using: :btree

end
