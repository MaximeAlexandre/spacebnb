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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_08_11_093412) do
=======
ActiveRecord::Schema.define(version: 2020_08_11_100828) do
>>>>>>> 98c99e2c6c1cbe13476f319291039892d1a61b85

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.integer "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_planets_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id", null: false
    t.bigint "planet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planet_id"], name: "index_reservations_on_planet_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "note"
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "reservation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "planets", "users"
  add_foreign_key "reservations", "planets"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "reservations"
  add_foreign_key "reviews", "users"
end
