# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_25_024903) do

  create_table "accounts", force: :cascade do |t|
    t.string "number"
    t.decimal "balance", precision: 5, scale: 2, default: "0.0", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", unique: true
  end

  create_table "deposits", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0", null: false
    t.integer "from_id"
    t.integer "to_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_deposits_on_from_id"
    t.index ["to_id"], name: "index_deposits_on_to_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "stock_type"
    t.decimal "balance", precision: 5, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "code"
    t.bigint "fund_id"
    t.string "fund_type"
    t.bigint "transactable_id"
    t.string "transactable_type"
    t.string "subject"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fund_id", "fund_type"], name: "index_transactions_on_fund_id_and_fund_type"
    t.index ["transactable_id", "transactable_type"], name: "index_transactions_on_transactable_id_and_transactable_type"
  end

  create_table "transfers", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0", null: false
    t.integer "from_id"
    t.integer "to_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_transfers_on_from_id"
    t.index ["to_id"], name: "index_transfers_on_to_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "withdraws", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0", null: false
    t.string "receiver_number"
    t.integer "from_id"
    t.integer "to_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_withdraws_on_from_id"
    t.index ["to_id"], name: "index_withdraws_on_to_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "deposits", "accounts", column: "to_id"
  add_foreign_key "deposits", "stocks", column: "from_id"
  add_foreign_key "transfers", "accounts", column: "from_id"
  add_foreign_key "transfers", "accounts", column: "to_id"
  add_foreign_key "withdraws", "accounts", column: "from_id"
  add_foreign_key "withdraws", "stocks", column: "to_id"
end
