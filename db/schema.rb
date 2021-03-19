# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_19_202400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cartitems", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_cartitems_on_item_id"
    t.index ["user_id"], name: "index_cartitems_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "largeimage"
    t.integer "qty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.decimal "price", precision: 6, scale: 2
  end

  create_table "order_items", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "description"
    t.integer "price"
    t.integer "quantity"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "total"
    t.string "charge"
    t.bigint "order_items_id"
    t.index ["order_items_id"], name: "index_orders_on_order_items_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cartitems", "items"
  add_foreign_key "cartitems", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_items", column: "order_items_id"
  add_foreign_key "orders", "users"
end
