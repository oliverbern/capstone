# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141128163001) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colordiamonds", force: true do |t|
    t.decimal  "weight"
    t.string   "color"
    t.string   "clarity"
    t.string   "treatment"
    t.string   "shape"
    t.string   "condgirdle"
    t.string   "condculet"
    t.string   "sizeculet"
    t.string   "conditioncut"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "height"
    t.text     "description"
    t.string   "intensitecolor"
    t.string   "bycolor1"
    t.string   "bycolor2"
    t.boolean  "diamondcertificate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colorgems", force: true do |t|
    t.string   "gemstonetype"
    t.string   "color"
    t.string   "shape"
    t.decimal  "length"
    t.decimal  "height"
    t.decimal  "width"
    t.decimal  "weight"
    t.boolean  "gemscertificate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "diamonds", force: true do |t|
    t.decimal  "weight"
    t.string   "color"
    t.string   "clarity"
    t.string   "treatment"
    t.string   "shape"
    t.string   "condgirdle"
    t.string   "condculet"
    t.string   "sizeculet"
    t.string   "conditioncut"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "height"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jewelleries", force: true do |t|
    t.string   "title"
    t.string   "stone1"
    t.string   "stone2"
    t.string   "stone3"
    t.string   "material1"
    t.string   "material2"
    t.string   "material3"
    t.text     "description"
    t.boolean  "certificate"
    t.string   "companymade"
    t.integer  "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "colorgem_id"
    t.integer  "colordiamonds_id"
    t.integer  "diamonds_id"
    t.integer  "jewellery_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["colordiamonds_id"], name: "index_line_items_on_colordiamonds_id"
  add_index "line_items", ["colorgem_id"], name: "index_line_items_on_colorgem_id"
  add_index "line_items", ["diamonds_id"], name: "index_line_items_on_diamonds_id"
  add_index "line_items", ["jewellery_id"], name: "index_line_items_on_jewellery_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
