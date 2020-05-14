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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_05_11_055529) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "post_number", null: false
    t.string "prefecture", null: false
    t.string "local", null: false
    t.string "localnumber", null: false
    t.string "building", null: false
    t.integer "tel_number"
=======
ActiveRecord::Schema.define(version: 2020_05_11_022422) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "post_number", null: false
    t.string "prefecture", null: false
    t.string "local", null: false
    t.string "local_number", null: false
    t.string "building"
>>>>>>> origin
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
<<<<<<< HEAD
    t.string "image", null: false
=======
    t.string "url", null: false
>>>>>>> origin
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
<<<<<<< HEAD
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
    t.string "name", null: false
    t.text "description", null: false
    t.string "category", null: false
    t.string "brand", null: false
    t.string "condition", null: false
    t.string "prefecture", null: false
    t.string "size"
    t.integer "price", null: false
    t.integer "shipping_days", null: false
    t.string "postage", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
>>>>>>> origin
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "firstname_kana", null: false
    t.string "lastname_kana", null: false
    t.integer "birth_year", null: false
    t.integer "birth_month", null: false
    t.integer "birth_day", null: false
    t.string "tel_number", null: false
<<<<<<< HEAD
    t.text "introduction"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "password_confirmation", default: "", null: false
=======
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
>>>>>>> origin
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
<<<<<<< HEAD
=======
  add_foreign_key "items", "users"
>>>>>>> origin
end
