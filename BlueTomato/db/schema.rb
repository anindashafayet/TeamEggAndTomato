ActiveRecord::Schema.define(version: 20171008191745) do

  create_table "accounts", force: :cascade do |t|
    t.integer "teenager_id"
    t.text "email"
    t.text "username"
    t.binary "passwd"
    t.text "privilege"
    t.integer "timestamp"
    t.binary "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teenager_id"], name: "index_accounts_on_teenager_id", unique: true
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

  create_table "client_requests", force: :cascade do |t|
    t.integer "account_id"
    t.integer "service_type_id"
    t.string "periods_type"
    t.date "period"
    t.string "period_detail"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "profiles", force: :cascade do |t|
    t.time "date_of_birth"
    t.text "description"
    t.text "phone"
    t.text "address"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "periods_type"
    t.date "period"
    t.string "period_detail"
    t.text "detail"
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