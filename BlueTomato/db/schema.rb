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

ActiveRecord::Schema.define(version: 20171008191745) do

  create_table "accounts", force: :cascade do |t|
    t.text "email"
    t.text "username"
    t.binary "passwd"
    t.text "privilege"
    t.integer "timestamp"
    t.binary "salt"
    t.integer "accountable_id"
    t.string "accountable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountable_id", "accountable_type"], name: "index_accounts_on_accountable_id_and_accountable_type", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "line1"
    t.string "line2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", unique: true
  end

<<<<<<< HEAD
  create_table "clients", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.date "birth_date"
    t.string "email_address"
    t.string "cell_phone"
=======
  create_table "profiles", force: :cascade do |t|
    t.time "date_of_birth"
    t.text "description"
    t.text "phone"
    t.text "address"
    t.integer "gender"
>>>>>>> d1af5d3e348347adef53c7b5f7e5300c9bd10681
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
