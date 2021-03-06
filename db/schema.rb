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

ActiveRecord::Schema.define(version: 2019_06_22_115901) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.time "time"
    t.date "date"
  end

  create_table "tickets", force: :cascade do |t|
    t.float "price_amount"
    t.string "price_currency"
    t.string "status"
    t.string "reservation_token"
    t.string "bought_by"
    t.integer "event_id"
    t.integer "lock_version", default: 0
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

end
