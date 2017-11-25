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

ActiveRecord::Schema.define(version: 20171125183232) do

  create_table "accounts", force: :cascade do |t|
    t.text "email"
    t.text "username"
    t.binary "password"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.integer "client_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["client_request_id"], name: "index_applicants_on_client_request_id"
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "client_requests", force: :cascade do |t|
    t.integer "service_type_id"
    t.date "period"
    t.string "period_detail"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "trigger"
    t.integer "matched_user"
    t.string "service_name"
    t.string "title"
    t.integer "address_id"
    t.integer "progress"
    t.text "fullfillment"
    t.integer "rating"
    t.text "feedback"
    t.string "city"
    t.integer "user_id"
    t.index ["address_id"], name: "index_client_requests_on_address_id"
    t.index ["user_id"], name: "index_client_requests_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.date "birth_date"
    t.string "email_address"
    t.string "cell_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "title"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ispublic"
    t.integer "client_request_id"
    t.integer "user_id"
    t.index ["client_request_id"], name: "index_messages_on_client_request_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.date "date_of_birth"
    t.string "about_me"
    t.string "phone"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teen_offerings", force: :cascade do |t|
    t.integer "account_id"
    t.integer "service_type_id"
    t.date "period"
    t.string "period_detail", default: "N/A"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "trigger"
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

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password", null: false
    t.string "fname", null: false
    t.string "lname", null: false
    t.binary "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
    t.integer "rating_count"
  end

end
