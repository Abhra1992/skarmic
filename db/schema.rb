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

ActiveRecord::Schema.define(version: 20140307171056) do

  create_table "applications", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "position_id"
    t.integer  "stage"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications", ["candidate_id"], name: "index_applications_on_candidate_id"
  add_index "applications", ["position_id"], name: "index_applications_on_position_id"

  create_table "candidates", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "username"
    t.text     "about"
    t.string   "city"
    t.string   "avatar"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "candidates", ["email"], name: "index_candidates_on_email", unique: true
  add_index "candidates", ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "established"
    t.text     "about"
    t.text     "benefits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: true do |t|
    t.string   "title"
    t.integer  "hours"
    t.integer  "duration"
    t.text     "skills_required"
    t.text     "skills_desired"
    t.integer  "compensation"
    t.text     "responsibilities"
    t.integer  "count"
    t.date     "available_from"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["company_id"], name: "index_positions_on_company_id"

  create_table "positions_recruiters", id: false, force: true do |t|
    t.integer "position_id",  null: false
    t.integer "recruiter_id", null: false
  end

  add_index "positions_recruiters", ["position_id", "recruiter_id"], name: "index_positions_recruiters_on_position_id_and_recruiter_id"
  add_index "positions_recruiters", ["recruiter_id", "position_id"], name: "index_positions_recruiters_on_recruiter_id_and_position_id"

  create_table "recruiters", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "username"
    t.string   "avatar"
    t.integer  "company_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "recruiters", ["company_id"], name: "index_recruiters_on_company_id"
  add_index "recruiters", ["email"], name: "index_recruiters_on_email", unique: true
  add_index "recruiters", ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true

end
