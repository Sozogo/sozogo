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

ActiveRecord::Schema.define(version: 20150104052815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "focuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "focuses_users", id: false, force: true do |t|
    t.integer "focus_id"
    t.integer "user_id"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages_users", force: true do |t|
    t.integer "language_id"
    t.integer "user_id"
  end

  create_table "professions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professions_projects", id: false, force: true do |t|
    t.integer "profession_id"
    t.integer "project_id"
  end

  create_table "project_attributes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.integer  "number_of_volunteers_needed"
    t.text     "recurring_rules"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "focus_id"
    t.text     "volunteer_instructions"
    t.integer  "user_id"
  end

  create_table "projects_project_attributes", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "project_attribute_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "organization_type"
    t.string   "organization_name"
    t.string   "address"
    t.string   "organization_contact_name"
    t.string   "phone_number"
    t.string   "denomination"
    t.string   "pastor"
    t.text     "service_times"
    t.string   "congregation_size"
    t.text     "organization_statement"
    t.string   "website"
    t.date     "birthday"
    t.string   "state"
    t.string   "zipcode"
  end

end
