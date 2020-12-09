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

ActiveRecord::Schema.define(version: 2020_12_09_191201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cartitems", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price", precision: 6, scale: 2
    t.index ["order_id"], name: "index_cartitems_on_order_id"
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

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "qty"
  end

  add_foreign_key "cartitems", "orders"
end
