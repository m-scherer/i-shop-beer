ActiveRecord::Schema.define(version: 20161105193158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beer_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  add_index "beer_orders", ["beer_id"], name: "index_beer_orders_on_beer_id", using: :btree
  add_index "beer_orders", ["order_id"], name: "index_beer_orders_on_order_id", using: :btree

  create_table "beers", force: :cascade do |t|
    t.float    "price"
    t.string   "name"
    t.integer  "style_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description"
    t.string   "image"
    t.integer  "status",      default: 0
  end

  add_index "beers", ["style_id"], name: "index_beers_on_style_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  add_foreign_key "beer_orders", "beers"
  add_foreign_key "beer_orders", "orders"
  add_foreign_key "beers", "styles"
  add_foreign_key "orders", "users"
end
