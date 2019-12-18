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

ActiveRecord::Schema.define(version: 2019_12_17_143649) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "postal_code", default: "", null: false
    t.string "address", default: "", null: false
    t.string "receiver_name", default: "", null: false
    t.boolean "is_main_address", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.integer "item_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.text "image_id", default: "", null: false
    t.integer "item_status", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "order_id", null: false
    t.integer "making_status", default: 0, null: false
    t.integer "item_count", null: false
    t.integer "ordered_price", null: false
    t.string "ordered_item_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "fee", default: 800, null: false
    t.integer "payment_method", null: false
    t.float "tax_rate", default: 0.1, null: false
    t.integer "order_status", default: 0, null: false
    t.string "ordered_receiver_name", default: "", null: false
    t.string "ordered_postal_code", null: false
    t.string "ordered_address", default: "", null: false
    t.integer "billing_amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "family_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "kana_family_name", default: "", null: false
    t.string "kana_first_name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.boolean "is_unsubscribe", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
