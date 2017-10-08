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

ActiveRecord::Schema.define(version: 20171008183645) do

  create_table "accounts", force: :cascade do |t|
    t.text "email"
    t.text "username"
    t.binary "passwd"
    t.text "privilege"
    t.integer "timestamp"
    t.binary "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_requests", force: :cascade do |t|
    t.integer "account_id"
    t.integer "service_type"
    t.string "periods_type"
    t.date "period"
    t.string "period_detail"
    t.text "offering_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teen_offerings", force: :cascade do |t|
    t.integer "account_id"
    t.integer "service_type"
    t.string "periods_type"
    t.date "period"
    t.string "period_detail"
    t.text "offering_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teenagers", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.date "birth_date"
    t.string "home_address"
    t.string "email_address"
    t.string "cell_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
