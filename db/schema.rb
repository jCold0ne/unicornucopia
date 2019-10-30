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

ActiveRecord::Schema.define(version: 2019_10_30_002124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "balances", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_balances_on_user_id"
  end

  create_table "conversions", force: :cascade do |t|
    t.integer "aud"
    t.string "stripe_id"
    t.bigint "balance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["balance_id"], name: "index_conversions_on_balance_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "unicorns_listing_id"
    t.bigint "buyer_balance_id"
    t.bigint "seller_balance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_balance_id"], name: "index_purchases_on_buyer_balance_id"
    t.index ["seller_balance_id"], name: "index_purchases_on_seller_balance_id"
    t.index ["unicorns_listing_id"], name: "index_purchases_on_unicorns_listing_id"
  end

  create_table "unicorns", force: :cascade do |t|
    t.string "name"
    t.integer "original_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unicorns_listings", force: :cascade do |t|
    t.bigint "unicorns_user_id"
    t.integer "buyout_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unicorns_user_id"], name: "index_unicorns_listings_on_unicorns_user_id"
  end

  create_table "unicorns_users", force: :cascade do |t|
    t.bigint "unicorn_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unicorn_id"], name: "index_unicorns_users_on_unicorn_id"
    t.index ["user_id"], name: "index_unicorns_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "balances", "users"
  add_foreign_key "conversions", "balances"
  add_foreign_key "purchases", "balances", column: "buyer_balance_id"
  add_foreign_key "purchases", "balances", column: "seller_balance_id"
  add_foreign_key "purchases", "unicorns_listings"
  add_foreign_key "unicorns_listings", "unicorns_users"
  add_foreign_key "unicorns_users", "unicorns"
  add_foreign_key "unicorns_users", "users"
end
