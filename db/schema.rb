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

ActiveRecord::Schema.define(version: 2021_04_25_111322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appellation_wineries", force: :cascade do |t|
    t.bigint "winery_id", null: false
    t.bigint "appellation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appellation_id"], name: "index_appellation_wineries_on_appellation_id"
    t.index ["winery_id"], name: "index_appellation_wineries_on_winery_id"
  end

  create_table "appellations", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "my_wine_cellars", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "wine_cellar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_my_wine_cellars_on_user_id"
    t.index ["wine_cellar_id"], name: "index_my_wine_cellars_on_wine_cellar_id"
  end

  create_table "my_wines", force: :cascade do |t|
    t.bigint "wine_id", null: false
    t.bigint "wine_cellar_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wine_cellar_id"], name: "index_my_wines_on_wine_cellar_id"
    t.index ["wine_id"], name: "index_my_wines_on_wine_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "quantity"
    t.integer "size"
    t.integer "vintage"
    t.bigint "my_wine_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["my_wine_id"], name: "index_stocks_on_my_wine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wine_cellars", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wineries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wines", force: :cascade do |t|
    t.integer "wine_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "appellation_winery_id", null: false
    t.string "name"
    t.index ["appellation_winery_id"], name: "index_wines_on_appellation_winery_id"
  end

  add_foreign_key "appellation_wineries", "appellations"
  add_foreign_key "appellation_wineries", "wineries"
  add_foreign_key "my_wine_cellars", "users"
  add_foreign_key "my_wine_cellars", "wine_cellars"
  add_foreign_key "my_wines", "wine_cellars"
  add_foreign_key "my_wines", "wines"
  add_foreign_key "stocks", "my_wines"
  add_foreign_key "wines", "appellation_wineries"
end
