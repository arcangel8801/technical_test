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

ActiveRecord::Schema.define(version: 2020_05_07_032643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "starts_at"
    t.date "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "schedule_details", force: :cascade do |t|
    t.bigint "schedule_id"
    t.string "hour"
    t.integer "coupons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_schedule_details_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "event_id"
    t.integer "week_day"
    t.date "standard_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_schedules_on_event_id"
  end



  add_foreign_key "schedule_details", "schedules"
  add_foreign_key "schedules", "events"
end
