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

ActiveRecord::Schema[7.1].define(version: 2023_11_22_081335) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "category_purchase_transactions", force: :cascade do |t|
    t.bigint "group_transaction_id", null: false
    t.bigint "money_transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_transaction_id"], name: "index_category_purchase_transactions_on_group_transaction_id"
    t.index ["money_transaction_id"], name: "index_category_purchase_transactions_on_money_transaction_id"
  end

  create_table "group_transactions", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_group_transactions_on_user_id"
  end

  create_table "money_transactions", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_money_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "category_purchase_transactions", "group_transactions"
  add_foreign_key "category_purchase_transactions", "money_transactions"
  add_foreign_key "group_transactions", "users"
  add_foreign_key "money_transactions", "users"
end
