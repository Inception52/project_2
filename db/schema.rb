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

ActiveRecord::Schema.define(version: 2018_10_10_011328) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "companies", force: :cascade do |t|
    t.integer "house_id"
    t.string "Name"
    t.string "Website"
    t.string "Address"
    t.float "Size"
    t.integer "Founded"
    t.string "Revenue"
    t.text "Synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_companies_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.integer "company_id"
    t.string "location"
    t.integer "square_footage"
    t.integer "year"
    t.string "style"
    t.integer "price"
    t.integer "floors"
    t.boolean "basement"
    t.string "owner"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_houses_on_company_id"
  end

  create_table "inquries", force: :cascade do |t|
    t.integer "pbuyer_id"
    t.string "subject"
    t.string "content"
    t.string "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pbuyer_id"], name: "index_inquries_on_pbuyer_id"
  end

  create_table "pbuyers", force: :cascade do |t|
    t.integer "house_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_pbuyers_on_house_id"
    t.index ["user_id"], name: "index_pbuyers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "realtor"
    t.boolean "hunter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin"
    t.boolean "switch", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
