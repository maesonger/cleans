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

ActiveRecord::Schema.define(version: 20170710174655) do

  create_table "charges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "clean_company_id"
    t.string   "square_meters_min"
    t.string   "square_meters_max"
    t.integer  "charge"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["clean_company_id"], name: "index_charges_on_clean_company_id", using: :btree
  end

  create_table "clean_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "tel"
    t.string   "email"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clean_companies_on_user_id", using: :btree
  end

  create_table "clean_contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clean_prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "clean_company_id"
    t.integer  "prefecture_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["clean_company_id", "prefecture_id"], name: "index_clean_prefectures_on_clean_company_id_and_prefecture_id", unique: true, using: :btree
    t.index ["clean_company_id"], name: "index_clean_prefectures_on_clean_company_id", using: :btree
    t.index ["prefecture_id"], name: "index_clean_prefectures_on_prefecture_id", using: :btree
  end

  create_table "clean_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "clean_company_id"
    t.string   "point"
    t.string   "comment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["clean_company_id"], name: "index_clean_reviews_on_clean_company_id", using: :btree
    t.index ["user_id", "clean_company_id"], name: "index_clean_reviews_on_user_id_and_clean_company_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_clean_reviews_on_user_id", using: :btree
  end

  create_table "clean_threads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "clean_company_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["clean_company_id"], name: "index_clean_threads_on_clean_company_id", using: :btree
    t.index ["user_id", "clean_company_id"], name: "index_clean_threads_on_user_id_and_clean_company_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_clean_threads_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.integer  "user_id"
    t.integer  "clean_company_id"
    t.string   "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["clean_company_id"], name: "index_contacts_on_clean_company_id", using: :btree
    t.index ["contact_id"], name: "index_contacts_on_contact_id", using: :btree
    t.index ["user_id"], name: "index_contacts_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "clean_thread_id"
    t.integer  "user_id"
    t.integer  "clean_company_id"
    t.string   "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["clean_company_id"], name: "index_messages_on_clean_company_id", using: :btree
    t.index ["clean_thread_id"], name: "index_messages_on_clean_thread_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "prefecture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "account_type"
    t.string   "email"
    t.string   "tel"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "charges", "clean_companies"
  add_foreign_key "clean_companies", "users"
  add_foreign_key "clean_prefectures", "clean_companies"
  add_foreign_key "clean_prefectures", "prefectures"
  add_foreign_key "clean_reviews", "clean_companies"
  add_foreign_key "clean_reviews", "users"
  add_foreign_key "clean_threads", "clean_companies"
  add_foreign_key "clean_threads", "users"
  add_foreign_key "contacts", "clean_companies"
  add_foreign_key "contacts", "contacts"
  add_foreign_key "contacts", "users"
  add_foreign_key "messages", "clean_companies"
  add_foreign_key "messages", "clean_threads"
  add_foreign_key "messages", "users"
end
